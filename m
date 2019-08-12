Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B00C189B2C
	for <lists+linux-rtc@lfdr.de>; Mon, 12 Aug 2019 12:18:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727559AbfHLKSn (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 12 Aug 2019 06:18:43 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:41313 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727564AbfHLKSm (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 12 Aug 2019 06:18:42 -0400
Received: by mail-wr1-f66.google.com with SMTP id j16so1805783wrr.8
        for <linux-rtc@vger.kernel.org>; Mon, 12 Aug 2019 03:18:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=7tZV/C+CttVM58WgI5MskpQ9uHYkdrjmm3CFUmvewno=;
        b=W+MxhXPlqRndnSDLfszOAzcHmVOW3zepwOG16SrxUolE+YVOJWBRuiuxxU4d/tK5ib
         eQc/dIBIFwTcCmLQhoZQwpHSv0Z9GeNPNm2xWCPE0fgp4Rh9yoW+7ATA94jKrSXX4WrQ
         0PUIZNkQIQMW0/ttZeHjwewCrBJc8dHUMnE8Cn+DuD1QiGxzXoM6iqtK0sO+mBwI+ZR7
         zwQC+FQ8Ksc9TIrTKQATDtnIIWAni1AXI50QDu2qvmTx5JqDjheXwahx+Ou0JnK5ao+T
         NOfUqJsGdgFTyM+0k1m2xkbZ6ucKIp08KA+67ZZzOLTy8Ejuzu78IbvQb3BAsjDxDHHV
         TuAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=7tZV/C+CttVM58WgI5MskpQ9uHYkdrjmm3CFUmvewno=;
        b=EwP+zTlRvgQKak+gdQth3oP2bmTwwLiFUQv9wquQ8aL7apvfx9qPTeFlKQa6p1a7SV
         Xn4IwzNceAwHo+jJPX7im9LfJafrelIiM7oV4FFJ3tFnbI6g+xbxh/NWSYbzUNjtwjQe
         sfNA2O89hienccxOGsAuiHpEBcPTU/I1P1/KXr7Hs1U+q33OmrO4wPqIpNctnetRJKiz
         EdT5fD7avy/fIPzOIyJww9eO9kv4yDqg5lJpyRI3YgAspqMzpMjhTE9rpoai9t07Hj0L
         M1wfKdNC9nHvD69yHEubvt4SEG2r5yQxdynhGoHBGDMzdlbWCZr7AUpF8PDG/IcVhi8F
         aHog==
X-Gm-Message-State: APjAAAW+6jwRa7BCcK9VcqvTT5cKSTRnXUBhgeOL43gosOP8eAxGmaKt
        8S2rX1SM/n/W0yIC8ipmkUSj7g==
X-Google-Smtp-Source: APXvYqwaN+jzxqGhqbcsiExg1wesaEC2LCxVh6tSbvfJCScUe6zZHJ2RcSBvMSMOl0MzKlQhkyBhKw==
X-Received: by 2002:a5d:408c:: with SMTP id o12mr37516277wrp.176.1565605120486;
        Mon, 12 Aug 2019 03:18:40 -0700 (PDT)
Received: from dell ([2.27.35.255])
        by smtp.gmail.com with ESMTPSA id d20sm10642375wmb.24.2019.08.12.03.18.39
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 12 Aug 2019 03:18:39 -0700 (PDT)
Date:   Mon, 12 Aug 2019 11:18:38 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Frank Wunderlich <frank-w@public-files.de>,
        Alessandro Zummo <a.zummo@towertech.it>,
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
Subject: Re: [PATCH v3 03/10] rtc: mt6397: move some common definitions into
 rtc.h
Message-ID: <20190812101838.GG26727@dell>
References: <20190729174154.4335-1-frank-w@public-files.de>
 <20190729174154.4335-4-frank-w@public-files.de>
 <20190805134842.GG3600@piout.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190805134842.GG3600@piout.net>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Mon, 05 Aug 2019, Alexandre Belloni wrote:

> On 29/07/2019 19:41:47+0200, Frank Wunderlich wrote:
> > From: Josef Friedl <josef.friedl@speed.at>
> > 
> > move code to separate header-file to reuse definitions later
> > in poweroff-driver (drivers/power/reset/mt6323-poweroff.c)
> > 
> > changes since v2: add missing commit-message
> 
> The changelog should be after the --- marker.
> > 
> > Suggested-by: Frank Wunderlich <frank-w@public-files.de>
> > Signed-off-by: Josef Friedl <josef.friedl@speed.at>
> > Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> > ---
> >  drivers/rtc/rtc-mt6397.c       | 55 +-------------------------
> >  include/linux/mfd/mt6397/rtc.h | 71 ++++++++++++++++++++++++++++++++++

I think include/linux/rtc/mt6397.h would be better?

Certainly from a maintainance PoV, it would be better reviewed and
looked after by an RTC expert.

> >  2 files changed, 72 insertions(+), 54 deletions(-)
> >  create mode 100644 include/linux/mfd/mt6397/rtc.h

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
