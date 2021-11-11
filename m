Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB54744D34A
	for <lists+linux-rtc@lfdr.de>; Thu, 11 Nov 2021 09:39:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229649AbhKKIme (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 11 Nov 2021 03:42:34 -0500
Received: from smtp2.axis.com ([195.60.68.18]:16139 "EHLO smtp2.axis.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229543AbhKKIme (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Thu, 11 Nov 2021 03:42:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1636619985;
  x=1668155985;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=/30Ap3V8khcmSDk0Kh7Og38EFMFY5oEZhbU4bYjbUDY=;
  b=S5JhU1eQWzegoYodZBBnwB1z3iggS5a2gFg9G9mM9q4UiBx+O7zskJIi
   RDKA1dnoVxm2cG5H/7iUaeH8+NsTXdRw9BhNGt2Ff+y/T56g1riTPMscu
   cp3dLIptZ6VZd162Gk6X5upHZghC3c2Awqj6Ksgd/OuKiuXcKuQKj8DgM
   8tu/3nhpHHo7GAcs6VD4+4ivTiX6YZrKKgxG37hbLRmvSszhRPNBxH4+R
   U/2F1SGIFmldqadcAex/Zf/WDxsR8Lcb2FpcENC+n5320si6ESYfPZbr4
   n+e2Z2S7acA2MY5be1cYeo55Qn2MplIYqQomZQr10B4WluRveasYPT/5r
   g==;
Subject: Re: [PATCH v2] rtc: rs5c372: Add RTC_VL_READ, RTC_VL_CLR ioctls
To:     Camel Guo <Camel.Guo@axis.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
CC:     kernel <kernel@axis.com>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20211110141442.9603-1-camel.guo@axis.com>
From:   Camel Guo <camelg@axis.com>
Message-ID: <2686847b-8834-8307-83b0-aabc7e276c8a@axis.com>
Date:   Thu, 11 Nov 2021 09:39:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20211110141442.9603-1-camel.guo@axis.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: se-mail02w.axis.com (10.20.40.8) To se-mail03w.axis.com
 (10.20.40.9)
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 11/10/21 3:14 PM, Camel Guo wrote:
> From: Camel Guo <camelg@axis.com>
> 
> In order to make it possible to get battery voltage status, this commit
> adds RTC_VL_READ, RTC_VL_CLR ioctl commands to rtc-rs5c372.
> 
> Signed-off-by: Camel Guo <camelg@axis.com>
> ---
> 
> v2: Set RTC_VL_BACKUP_LOW if VDET is set. Do not clear PON, XSTP in
> RTC_VL_CLR ioctl
> 
>   drivers/rtc/rtc-rs5c372.c | 60 +++++++++++++++++++++++++++++++++++++++
>   1 file changed, 60 insertions(+)
> 
> diff --git a/drivers/rtc/rtc-rs5c372.c b/drivers/rtc/rtc-rs5c372.c
> index 80980414890c..4ab8718d9360 100644
> --- a/drivers/rtc/rtc-rs5c372.c
> +++ b/drivers/rtc/rtc-rs5c372.c
> @@ -485,6 +485,65 @@ static int rs5c372_rtc_proc(struct device *dev, 
> struct seq_file *seq)
>   #define rs5c372_rtc_proc        NULL
>   #endif
> 
> +#ifdef CONFIG_RTC_INTF_DEV
> +static int rs5c372_ioctl(struct device *dev, unsigned int cmd, unsigned 
> long arg)
> +{
> +       struct rs5c372  *rs5c = i2c_get_clientdata(to_i2c_client(dev));
> +       unsigned char   ctrl2;
> +       int             addr;
> +       unsigned int    flags;
> +
> +       dev_dbg(dev, "%s: cmd=%x\n", __func__, cmd);
> +
> +       addr = RS5C_ADDR(RS5C_REG_CTRL2);
> +       ctrl2 = i2c_smbus_read_byte_data(rs5c->client, addr);
> +
> +       switch (cmd) {
> +       case RTC_VL_READ:
> +               flags = 0;
> +
> +               switch (rs5c->type) {
> +               case rtc_r2025sd:
> +               case rtc_r2221tl:
> +                       if ((rs5c->type == rtc_r2025sd && !(ctrl2 & 
> R2x2x_CTRL2_XSTP)) ||
> +                               (rs5c->type == rtc_r2221tl &&  (ctrl2 & 
> R2x2x_CTRL2_XSTP))) {
> +                               flags |= RTC_VL_DATA_INVALID;
> +                       }
> +                       if (ctrl2 & R2x2x_CTRL2_VDET)
> +                               flags |= RTC_VL_BACKUP_LOW;
> +                       break;
> +               default:
> +                       if (ctrl2 & RS5C_CTRL2_XSTP)
> +                               flags |= RTC_VL_DATA_INVALID;
> +                       break;
> +               }
> +
> +               return put_user(flags, (unsigned int __user *)arg);
> +       case RTC_VL_CLR:
> +               /* clear VDET bit */
> +               switch (rs5c->type) {
> +               case rtc_r2025sd:
> +               case rtc_r2221tl:
> +                       ctrl2 &= ~R2x2x_CTRL2_VDET;
> +               default:
> +                       break;
> +               }
> +
> +               if (i2c_smbus_write_byte_data(rs5c->client, addr, ctrl2) 
> < 0) {
> +                       dev_dbg(&rs5c->client->dev, "%s: write error in 
> line %i\n",
> +                                       __func__, __LINE__);
> +                       return -EIO;
> +               }
> +               return 0;
> +       default:
> +               return -ENOIOCTLCMD;
> +       }
> +       return 0;
> +}
> +#else
> +#define rs5c372_ioctl  NULL
> +#endif
> +
>   static const struct rtc_class_ops rs5c372_rtc_ops = {
>           .proc           = rs5c372_rtc_proc,
>           .read_time      = rs5c372_rtc_read_time,
> @@ -492,6 +551,7 @@ static const struct rtc_class_ops rs5c372_rtc_ops = {
>           .read_alarm     = rs5c_read_alarm,
>           .set_alarm      = rs5c_set_alarm,
>           .alarm_irq_enable = rs5c_rtc_alarm_irq_enable,
> +       .ioctl          = rs5c372_ioctl,
>   };
> 
>   #if IS_ENABLED(CONFIG_RTC_INTF_SYSFS)
> -- 
> 2.20.1
> 

PATCH v3 is uploaded with the fix of avoiding setting ctrl2 register 
when unnecessary.  Please review v3 instead.
