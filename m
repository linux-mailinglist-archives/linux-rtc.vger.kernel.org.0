Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 24E67F2CEA
	for <lists+linux-rtc@lfdr.de>; Thu,  7 Nov 2019 11:59:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387958AbfKGK7z (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 7 Nov 2019 05:59:55 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:37070 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727278AbfKGK7z (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 7 Nov 2019 05:59:55 -0500
Received: by mail-wr1-f68.google.com with SMTP id t1so2511545wrv.4
        for <linux-rtc@vger.kernel.org>; Thu, 07 Nov 2019 02:59:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=jX1PhmjNScp3jK1QdS94+FmYelbSzRbuM5rLkgj2mRc=;
        b=gv+58ZdQhGmq+GSICmELQimLBk8wdLBnuM4sV5AYBI6PFK6R1q57SkLujuZFsqBbIW
         d4fvguep3DRTSE36XkyzSGdawGJvzJcnJsweoUsW1hT+gfrDaH7/oj5XV5BgJD/i/TSh
         cYZh23loP+Tpux0WccRjDYy2MhqgESdHzw006MnoAb8qYEFqsSSp4INY2zwoR8ffeBVt
         nCQOtUONYVcwNMYqFvT/8BFQN/R3/iUUmq5oe14x/FA3ILbBkaWej051Z0yiyCAY0lT8
         38lhC8DMG8rxb8/H5l5Ir8laLTPM2vEPeUceswAFLCIJ+I+He9suOmS8n4pVNVwsg3gf
         fuKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=jX1PhmjNScp3jK1QdS94+FmYelbSzRbuM5rLkgj2mRc=;
        b=QTSaLLxhHwzIXAJ99qsQTTfskGXPobi/visMLgk51YsMM5kmbdGxWyBALgwO53KJmX
         +nu/e/0q2LVcljztqMEYBvftHBm78JHhNZVyBPWM26zX1PBEFXXsD2UvV+VEP6ilbgRD
         Ov3r+PiI0MLSKN8y61VQQRvawfVaMvqLlfUFrTA6lNDVwolZCGsRxBzSzohIaAtXEf02
         FdYz3J8fWu4x6jEoBybS+nl6TR0DTxJaniMrox5+cVjp9V2q2ESKtL/Hta0Zmd0vW1XS
         08a6BMOwBc3TzbEEczjYtucFv0Yor2tH+Vx5PXiJLe/CxzDd6iuhvs5XFDClrlfu7jIv
         rHCA==
X-Gm-Message-State: APjAAAUFhiAserfJ9Pprvjbi3Cnc7fmSTm/5jCmX5lszJpcNsknBQ0gu
        J5J5eZD/vQo5WCJMFcY1bEzUkA==
X-Google-Smtp-Source: APXvYqwU4MnGMqehuKQuaV7oe8goOIQTO0A3B4MmI0/ehUPIDN+z0xgTieF9mKZvlobJENIScotayw==
X-Received: by 2002:adf:dc81:: with SMTP id r1mr2444267wrj.84.1573124391594;
        Thu, 07 Nov 2019 02:59:51 -0800 (PST)
Received: from dell ([95.147.198.88])
        by smtp.gmail.com with ESMTPSA id b186sm1479648wmb.21.2019.11.07.02.59.50
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 Nov 2019 02:59:50 -0800 (PST)
Date:   Thu, 7 Nov 2019 10:59:49 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        mazziesaccount@gmail.com, Alessandro Zummo <a.zummo@towertech.it>,
        linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] rtc: bd70528: Fix hour register mask
Message-ID: <20191107105949.GA19195@dell>
References: <20191023114751.GA14100@localhost.localdomain>
 <20191105165317.GC8309@piout.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191105165317.GC8309@piout.net>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Tue, 05 Nov 2019, Alexandre Belloni wrote:

> On 23/10/2019 14:47:51+0300, Matti Vaittinen wrote:
> > When RTC is used in 24H mode (and it is by this driver) the maximum
> > hour value is 24 in BCD. This occupies bits [5:0] - which means
> > correct mask for HOUR register is 0x3f not 0x1f. Fix the mask
> > 
> > Fixes: 32a4a4ebf768 ("rtc: bd70528: Initial support for ROHM bd70528 RTC")
> > Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> > ---
> >  include/linux/mfd/rohm-bd70528.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> Applied, thanks.

You have been duped. This is clearly not an RTC patch.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
