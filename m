Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 018A51182D2
	for <lists+linux-rtc@lfdr.de>; Tue, 10 Dec 2019 09:52:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726883AbfLJIwx (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 10 Dec 2019 03:52:53 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:46703 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726847AbfLJIwx (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 10 Dec 2019 03:52:53 -0500
Received: by mail-wr1-f68.google.com with SMTP id z7so18942160wrl.13
        for <linux-rtc@vger.kernel.org>; Tue, 10 Dec 2019 00:52:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=wu72ZcmsFHLVkAALMmbmLhHmQQPjxMnxvhre6csNNNw=;
        b=Jpct3dZ79bLrJVYVAnUUlQlf9+z5GnfPRqxm1SCkWaAX4EzJW1DvJaHb1kwIoqbS2T
         x3iqypxU0qLYRpUk16PdsdbC7hDJMPnlljbS9sAmBEj7xerpWHSzo7Vu6DDioD2Sl0R/
         RtHnkO8jP0Q3zEAflyhfyb0U9435zmG0Eljeu26sigkMCO9Sy7QnwPBqlAfKiUYIq3mx
         UQYu4oKbrloYniRIIbNrvLgVazCm0gSj+KiZiExfq7Ky64IMfAD3qQkgDyB0ruTnNFZn
         xO8FOXbKKu4oIy1Y5a7i2yklkS6q0PkPaG/NcvXoMwjVUZPs2ju4LLfsLlMbvyMb/2Ad
         5qyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=wu72ZcmsFHLVkAALMmbmLhHmQQPjxMnxvhre6csNNNw=;
        b=Fzt4I27hYAHGK7X6lQ7iKSY8G9AnUCJ1DtfgZA+nUvnwUuJ+kt59+z2+GALWodvji6
         aBKvnwVvlr6xWvGrxseJZu9SCCXE9ukkfDnhMiIig3aQkNkT9QN9bxL7IYuZsoKpd5sX
         haTtRPv8Z1ue1zAJ/NFeqORxuJ4BlVDFcBghHiiN/ep2u+xE3326Wl1TF5qeC4the70f
         oD5id9tjlM9uRe7HtNBmY6eX0r1kjXj6JQybRpffAAdQ+7URBTM9CfzuWzsUxm6VlAPc
         vtbJm5vtACmYms+lWpwbCfxF/eYtOFR7u9+6+BsmD7E7cys9dYsrXaVHyf4RNZjqM+bm
         zGwg==
X-Gm-Message-State: APjAAAUWBbb0O5+m5bwOd1LimknhQLGwwgFsiB9Zt03oeQVcGG4Ck5ID
        iBccToehpnHThA2g9cxBkqfsug==
X-Google-Smtp-Source: APXvYqxNtdqEUf0ybgBiLfNWM/2TgJzzIP+gMMTyOVmPeFHLT7MsWwJUI/pg+ie8aPi1hMxoH7lPLg==
X-Received: by 2002:adf:f850:: with SMTP id d16mr1853669wrq.161.1575967971012;
        Tue, 10 Dec 2019 00:52:51 -0800 (PST)
Received: from dell (h185-20-99-176.host.redstation.co.uk. [185.20.99.176])
        by smtp.gmail.com with ESMTPSA id s15sm2518432wrp.4.2019.12.10.00.52.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2019 00:52:50 -0800 (PST)
Date:   Tue, 10 Dec 2019 08:52:43 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Andreas Kemnade <andreas@kemnade.info>
Cc:     robh+dt@kernel.org, mark.rutland@arm.com, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
        stefan@agner.ch, b.galvani@gmail.com, phh@phh.me,
        letux-kernel@openphoenux.org
Subject: Re: [PATCH v3 1/6] dt-bindings: mfd: rn5t618: Document optional
 property interrupts
Message-ID: <20191210085243.GR3468@dell>
References: <20191129212045.18325-1-andreas@kemnade.info>
 <20191129212045.18325-2-andreas@kemnade.info>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191129212045.18325-2-andreas@kemnade.info>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Fri, 29 Nov 2019, Andreas Kemnade wrote:

> These chips use interrupts for various things like rtc alarm.
> 
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> ---
>  Documentation/devicetree/bindings/mfd/rn5t618.txt | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/rn5t618.txt b/Documentation/devicetree/bindings/mfd/rn5t618.txt
> index b74e5e94d1cb..05650e1ab28a 100644
> --- a/Documentation/devicetree/bindings/mfd/rn5t618.txt
> +++ b/Documentation/devicetree/bindings/mfd/rn5t618.txt
> @@ -15,6 +15,7 @@ Required properties:
>   - reg: the I2C slave address of the device
>  
>  Optional properties:
> + - interrupts: interrupt mapping for IRQ

Please link to the document that describes it, as below.

NB: Relative paths are usually preferred.

>   - system-power-controller:
>     See Documentation/devicetree/bindings/power/power-controller.txt
>  
> @@ -32,6 +33,8 @@ Example:
>  	pmic@32 {
>  		compatible = "ricoh,rn5t618";
>  		reg = <0x32>;
> +		interrupt-parent = <&gpio5>;
> +		interrupts = <11 IRQ_TYPE_EDGE_FALLING>;
>  		system-power-controller;
>  
>  		regulators {

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
