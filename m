Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 75C1A8A210
	for <lists+linux-rtc@lfdr.de>; Mon, 12 Aug 2019 17:15:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727304AbfHLPPb (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 12 Aug 2019 11:15:31 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:34551 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727061AbfHLPP1 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 12 Aug 2019 11:15:27 -0400
Received: by mail-wr1-f68.google.com with SMTP id 31so104933610wrm.1
        for <linux-rtc@vger.kernel.org>; Mon, 12 Aug 2019 08:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=kxqbuY4B1dItH0K76N5jkNqR9OjL/xCxchMz+Ee+8mE=;
        b=lr/cfQpIZIaBSo6b9Q3zxeOVa2+U0uJcOFT+1l6c30ZI2NbC+DOeDIoBUtdF0VF0ov
         iwtSxkFt8UCR7dfeUmqY7rXB+7He3ZhOOiiMgmL9FmhQZgX9io9AucbNrI9nJyrQPpiQ
         E09PfHLDjAQW2IEh/0AroZo9xVRg/aeq/biCAQVAdq5XJb+nsYnv99EIGDBAAuOFFspl
         SvwOCXElndrpLEvzqNZeT1j0BHnGnbf85ioODXWRgasd1a/qtdcwvPJPWxwnBX0nqdQV
         SOBGjVPPASSZhDPvsfTKmRg64PHj8QlxLf59HMArxIzwN0KgPsk+8C2CZB54WJ5SHGl+
         0P7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=kxqbuY4B1dItH0K76N5jkNqR9OjL/xCxchMz+Ee+8mE=;
        b=bLMbbEHGGs7GcqdHXF4nY4eBHOa4Y8obYwNFeIV+xlT6bCJ52KTY6ulqLTHKANW3u9
         yy/E/ZhE+vwuZFz7NGcYWzxBnq/27hsVV03kQ8fgKWCfCDUz7CEfoXccPOMVhCE3kUvY
         IJiJGBBhA69F7gzQmowAbkBtaAG0lswUWrjOOCR2DKy5+IPrfzus7gi07z2etlXJC13M
         PFFtzVtoypAXTNTEhjr0Bx5dVVP73kgCVMjDDP8kyUC9G5R2owomCSXDfPMhaxB9jZuU
         aGQfETSTKbTmyDnoIkd2uuPTCZ3O1LLE3IxiClxZf3WS7mXq1GzgivwLaF1U/MVu1QGT
         VgaA==
X-Gm-Message-State: APjAAAX0dwWDPzPASHsIM0fGJ2Wyw5m+sm+EAZhYZSE0Pt/BLYvlpFUo
        8adICGvqRekMmbg6nUuNIX5K8g==
X-Google-Smtp-Source: APXvYqyuePFlhOmpa07Fm6SyAPeyyhzMKjfeXv4MqLRtO62+RwuhXTyFoBewlD8zEFNaSN29kSEuGg==
X-Received: by 2002:adf:f008:: with SMTP id j8mr26439756wro.129.1565622925048;
        Mon, 12 Aug 2019 08:15:25 -0700 (PDT)
Received: from dell ([2.27.35.255])
        by smtp.gmail.com with ESMTPSA id f134sm30682221wmg.20.2019.08.12.08.15.23
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 12 Aug 2019 08:15:24 -0700 (PDT)
Date:   Mon, 12 Aug 2019 16:15:22 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Frank Wunderlich <frank-w@public-files.de>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Allison Randal <allison@lohutok.net>,
        "David S. Miller" <davem@davemloft.net>,
        devicetree@vger.kernel.org, Eddie Huang <eddie.huang@mediatek.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org,
        linux-rtc@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Richard Fontana <rfontana@redhat.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sean Wang <sean.wang@mediatek.com>,
        Sebastian Reichel <sre@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        "Tianping . Fang" <tianping.fang@mediatek.com>,
        Josef Friedl <josef.friedl@speed.at>
Subject: Re: [PATCH v5 01/10] dt-bindings: add powercontroller
Message-ID: <20190812151522.GW26727@dell>
References: <20190812121511.4169-1-frank-w@public-files.de>
 <20190812121511.4169-2-frank-w@public-files.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190812121511.4169-2-frank-w@public-files.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Mon, 12 Aug 2019, Frank Wunderlich wrote:

> From: Josef Friedl <josef.friedl@speed.at>
> 
> add mt6323-rtc and mt6323-pwrc to mt6397 mfd DT bindings
> an example is shown in mt6323-poweroff.txt
> 
> Suggested-by: Frank Wunderlich <frank-w@public-files.de>
> Signed-off-by: Josef Friedl <josef.friedl@speed.at>
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>
> ---
> changes since v4: use relative path
> changes since v3: none
> changes since v2: separated rtc-mt6397.txt to part 2
> ---
>  .../devicetree/bindings/mfd/mt6397.txt        | 20 +++++++++++++------
>  .../bindings/power/reset/mt6323-poweroff.txt  | 20 +++++++++++++++++++
>  2 files changed, 34 insertions(+), 6 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/power/reset/mt6323-poweroff.txt
> 
> diff --git a/Documentation/devicetree/bindings/mfd/mt6397.txt b/Documentation/devicetree/bindings/mfd/mt6397.txt
> index 0ebd08af777d..063f5fe1cace 100644
> --- a/Documentation/devicetree/bindings/mfd/mt6397.txt
> +++ b/Documentation/devicetree/bindings/mfd/mt6397.txt
> @@ -8,11 +8,12 @@ MT6397/MT6323 is a multifunction device with the following sub modules:
>  - Clock
>  - LED
>  - Keys
> +- Power controller
>  
>  It is interfaced to host controller using SPI interface by a proprietary hardware
>  called PMIC wrapper or pwrap. MT6397/MT6323 MFD is a child device of pwrap.
>  See the following for pwarp node definitions:
> -Documentation/devicetree/bindings/soc/mediatek/pwrap.txt
> +../../bindings/soc/mediatek/pwrap.txt
>  
>  This document describes the binding for MFD device and its sub module.
>  
> @@ -22,14 +23,16 @@ compatible: "mediatek,mt6397" or "mediatek,mt6323"
>  Optional subnodes:
>  
>  - rtc
> -	Required properties:
> +	Required properties: Should be one of follows
> +		- compatible: "mediatek,mt6323-rtc"
>  		- compatible: "mediatek,mt6397-rtc"
> +	For details, see ../../bindings/rtc/rtc-mt6397.txt

Apologies for the ambiguity.  I don't think you need to go all the way
back to 'bindings'.  Just one step back will do fine.  ../rtc/* will be
fine here.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
