import os
import resend

resend.api_key = os.environ.get("RESEND_API_KEY")


def send_order_invoice(customer_email, order_data):
    try:
        items_html = ""
        for item in order_data.get("items", []):
            items_html += f"""
            <tr>
                <td style="padding: 10px; border-bottom: 1px solid #eee;">{item.name}</td>
                <td style="padding: 10px; border-bottom: 1px solid #eee; text-align: center;">{item.quantity}</td>
                <td style="padding: 10px; border-bottom: 1px solid #eee; text-align: right;">R {item.price:,.2f}</td>
            </tr>
            """

        html_content = f"""
        <div style="font-family: Arial, sans-serif; color: #333; max-width: 600px; margin: auto; padding: 20px; border: 1px solid #eaeaea; border-radius: 10px;">
            <h2 style="color: #0EA5E9; text-align: center;">Ville Cycles</h2>
            <h3 style="text-align: center; margin-top: 0;">Order Confirmation & Invoice</h3>
            
            <p><strong>Original Customer Email:</strong> {customer_email}</p>
            <p><strong>Order ID:</strong> #{order_data.get('id')}</p>
            <p><strong>Date:</strong> {order_data.get('date')}</p>
            
            <table style="width: 100%; border-collapse: collapse; margin-top: 20px;">
                <thead>
                    <tr style="background-color: #f8f9fa;">
                        <th style="padding: 10px; text-align: left; border-bottom: 2px solid #dee2e6;">Item</th>
                        <th style="padding: 10px; text-align: center; border-bottom: 2px solid #dee2e6;">Qty</th>
                        <th style="padding: 10px; text-align: right; border-bottom: 2px solid #dee2e6;">Price</th>
                    </tr>
                </thead>
                <tbody>
                    {items_html}
                </tbody>
            </table>
            
            <div style="text-align: right; margin-top: 20px;">
                <h3>Total: R {order_data.get('total_price'):,.2f}</h3>
            </div>
            
            <hr style="border: none; border-top: 1px solid #eee; margin: 30px 0;">
            <p style="font-size: 12px; color: #777; text-align: center;">Internal notification from Ville Cycles platform.</p>
        </div>
        """

        target_inbox = "rushiljivan@gmail.com"

        params = {
            "from": "Ville Cycles <onboarding@resend.dev>",
            "to": [target_inbox],
            "subject": f"New Order Invoice #{order_data.get('id')} - Ville Cycles",
            "html": html_content,
        }

        response = resend.Emails.send(params)
        return response
    except Exception as e:
        print(f"Error sending invoice email: {e}")
        return None
