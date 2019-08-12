Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 27D2989F93
	for <lists+linux-rtc@lfdr.de>; Mon, 12 Aug 2019 15:24:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728552AbfHLNYC (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 12 Aug 2019 09:24:02 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:35711 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728117AbfHLNYC (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 12 Aug 2019 09:24:02 -0400
Received: by mail-wr1-f66.google.com with SMTP id k2so18706410wrq.2
        for <linux-rtc@vger.kernel.org>; Mon, 12 Aug 2019 06:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=nC0XBOiWbAbQwJIvttLNUSDXZEWVPgrZEH9kYI4ESEg=;
        b=KdowPy/ZBvnwn/HSU7gjkVq9UrYpR3h4Rz7yrxwQA3ohuwT4La1YEbafzwTQiyGbB3
         6QonaqtKmwTvQvVAkUuXqhFlDfDjkaXKQ7zpwE7eGxhuj1ceYyytsva8K5UQ8S9Sxa1l
         0Y1oon8rOVVaf+boODQgVUswo8xgye+BoTn+yDsiXWTW/NS6IQsn/plpM4JQaaNP4O6B
         TqZTxR3XHrKVwJXd9XdY0hqFqBNW8M1q45w82I966F/alSFqF39B+Nsz1nWQEnNynAc4
         A2YNPddK8smYE3BcVulLdkdiz+QMZyywgQdjm7O4meR9DNvs9jp6Y3XjTE1cuP7rEBBJ
         1TgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=nC0XBOiWbAbQwJIvttLNUSDXZEWVPgrZEH9kYI4ESEg=;
        b=Os8PbTYfiAuzE0gNWgWgkD8ezbOLL1RTQb0KVocb9UzU5UniqnHjB9GSusQ3giqSxe
         XknaRRQOaiO+zpueii2Y+DWizSS868M8cy3k8qE15LTKy5kU/KV0wPIFG7iLc5nR1gb9
         MfDL2KEWaHt+6jQLmiZiW6OGMFtadnkIl2F+n4wrlSlgaS7saiCg7BI1mTyv1LfT66kW
         +AatUHgXB+3YIvclmeM/WT4WDoruFExIuzNF1il2i9a2joV93J+GdRdtasqd+/5mR4sU
         41RqyGBKMRaE0CPEr6CqoCJlUs9P5Ha00d6Ccfqsl9Gpf3jUQwskoIPMBbCq0Ivr2M07
         pGDQ==
X-Gm-Message-State: APjAAAU9DlxBI6blzbkuATue209wFRiLeyuDfzx4Dl5MfoEgc2yKa60t
        8Gi+5K8yhzf+czE7acNhhzKyvQ==
X-Google-Smtp-Source: APXvYqzLO2AY4MikUonMGWLbUw1cnzGTo7DsP/PsiUuAIcFjooUQxIKV9Ku81rDgvyEOx2q7Cg6gpA==
X-Received: by 2002:adf:8364:: with SMTP id 91mr40735060wrd.13.1565616239967;
        Mon, 12 Aug 2019 06:23:59 -0700 (PDT)
Received: from dell ([2.27.35.255])
        by smtp.gmail.com with ESMTPSA id g7sm25060681wmg.8.2019.08.12.06.23.58
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 12 Aug 2019 06:23:59 -0700 (PDT)
Date:   Mon, 12 Aug 2019 14:23:57 +0100
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
Subject: Re: [PATCH v5 08/10] power: reset: add driver for mt6323 poweroff
Message-ID: <20190812132357.GU26727@dell>
References: <20190812121511.4169-1-frank-w@public-files.de>
 <20190812121511.4169-9-frank-w@public-files.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190812121511.4169-9-frank-w@public-files.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Mon, 12 Aug 2019, Frank Wunderlich wrote:

> From: Josef Friedl <josef.friedl@speed.at>
> 
> add poweroff driver for mt6323 and make Makefile and Kconfig-Entries
> 
> Suggested-by: Frank Wunderlich <frank-w@public-files.de>
> Signed-off-by: Josef Friedl <josef.friedl@speed.at>
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
> changes since v4: none
> changes since v3: none
> changes since v2: none (=v2 part 5)
> ---
>  drivers/power/reset/Kconfig           | 10 +++
>  drivers/power/reset/Makefile          |  1 +
>  drivers/power/reset/mt6323-poweroff.c | 97 +++++++++++++++++++++++++++

>  include/linux/mfd/mt6397/core.h       |  2 +

This looks like an unrelated change.

Please separate it out.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
