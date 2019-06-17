Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A52D94845B
	for <lists+linux-rtc@lfdr.de>; Mon, 17 Jun 2019 15:45:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728069AbfFQNpG (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 17 Jun 2019 09:45:06 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:43797 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725983AbfFQNpF (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 17 Jun 2019 09:45:05 -0400
X-Originating-IP: 92.137.69.152
Received: from localhost (alyon-656-1-672-152.w92-137.abo.wanadoo.fr [92.137.69.152])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id AFA54C0016;
        Mon, 17 Jun 2019 13:45:01 +0000 (UTC)
Date:   Mon, 17 Jun 2019 15:45:01 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Phil Howard <phil@pimoroni.co.uk>
Cc:     linux-rtc@vger.kernel.org
Subject: Re: rtc: rv3028: Add backup switchover mode support
Message-ID: <20190617134501.GA28514@piout.net>
References: <CAGk-eV5UPsJGvmovyz5maEHuEDN3374hzxSptsXxghu3KRO6QQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGk-eV5UPsJGvmovyz5maEHuEDN3374hzxSptsXxghu3KRO6QQ@mail.gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hello,

I'm sorry to reply so late, I had to look into it first.

On 10/04/2019 11:26:58+0100, Phil Howard wrote:
> Adds support for the backup switchover mode register in the rv3028
> RTC. This allows the clock to automatically switch over to a backup
> power supply when the main power supply is lost.
> 

This message should probably be moved...

> From 7ee04005288f0543debe46ed918b77374ad63adf Mon Sep 17 00:00:00 2001
> From: Phil Howard <phil@gadgetoid.com>
> Date: Fri, 29 Mar 2019 10:53:14 +0000
> Subject: [PATCH 1/3] rtc: rv3028: Add backup switchover mode support
> 

... here

> Signed-off-by: Phil Howard <phil@pimoroni.com>
> ---
>  drivers/rtc/rtc-rv3028.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/drivers/rtc/rtc-rv3028.c b/drivers/rtc/rtc-rv3028.c
> index d04c2d4816555..b69d8e6408aae 100644
> --- a/drivers/rtc/rtc-rv3028.c
> +++ b/drivers/rtc/rtc-rv3028.c
> @@ -74,6 +74,7 @@
> 
>  #define RV3028_BACKUP_TCE        BIT(5)
>  #define RV3028_BACKUP_TCR_MASK        GENMASK(1,0)
> +#define RV3028_BACKUP_BSM_MASK        0x0C
> 
>  #define OFFSET_STEP_PPT            953674
> 
> @@ -601,6 +602,7 @@ static int rv3028_probe(struct i2c_client *client)
>      struct rv3028_data *rv3028;
>      int ret, status;
>      u32 ohms;
> +    u8 bsm;
>      struct nvmem_config nvmem_cfg = {
>          .name = "rv3028_nvram",
>          .word_size = 1,
> @@ -671,6 +673,21 @@ static int rv3028_probe(struct i2c_client *client)
>      if (ret)
>          return ret;
> 
> +    /* setup backup switchover mode */
> +    if (!device_property_read_u8(&client->dev, "backup-switchover-mode",
> +                     &bsm))  {
> +        if (bsm <= 3) {
> +            ret = regmap_update_bits(rv3028->regmap, RV3028_BACKUP,
> +                RV3028_BACKUP_BSM_MASK,
> +                (bsm & 0x03) << 2);
> +
> +            if (ret)
> +                return ret;
> +        } else {
> +            dev_warn(&client->dev, "invalid backup switchover mode value\n");
> +        }
> +    }
> +
>      /* setup trickle charger */
>      if (!device_property_read_u32(&client->dev, "trickle-resistor-ohms",
>                        &ohms)) {
> 
> From ae9228b10d864368b934839156b6d9fa58fb5724 Mon Sep 17 00:00:00 2001
> From: Phil Howard <phil@gadgetoid.com>
> Date: Fri, 29 Mar 2019 10:57:07 +0000
> Subject: [PATCH 2/3] dt-bindings: rv3028 backup switchover support
> 

This needs a proper commit message. Also, please use git-send email
because both patches should be sent separately.

> Signed-off-by: Phil Howard <phil@pimoroni.com>
> ---
>  Documentation/devicetree/bindings/rtc/rtc.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/rtc/rtc.txt
> b/Documentation/devicetree/bindings/rtc/rtc.txt
> index 3e6a215e7304b..33fcad8754ec2 100644
> --- a/Documentation/devicetree/bindings/rtc/rtc.txt
> +++ b/Documentation/devicetree/bindings/rtc/rtc.txt
> @@ -26,6 +26,7 @@ below.
>  - trickle-diode-disable :   Do not use internal trickle charger diode Should be
>                              given if internal trickle charger diode should be
>                              disabled
> +- backup-switchover-mode :  Configure RTC backup power supply switch behaviour

Because we want that property to be generic, I had a look at what the
other RTCs settings are:

 - RV3028 has disabled, direct, standby and level switching

 - Abracon (b5ze) has standard (VDD < threshold) and direct (VDD < VBAT),
this maps well to level and direct.

 - Intersil (isl12026, isl1208, isl1219) has standard and legacy, this maps
to level and direct.

 - I also took time to look at other RTCs, most of them only have an
enable/disable setting.


What I think is needed is to give meaningful names, using defines. We
can probably keep the BSM values (i.e 0 for disabled, 1 for direct, 2
for standby and 3 for threshold). I can take are of that part if you
want.


-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
