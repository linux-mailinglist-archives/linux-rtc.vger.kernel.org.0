Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78C2B2CBD90
	for <lists+linux-rtc@lfdr.de>; Wed,  2 Dec 2020 13:58:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729896AbgLBM5E (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 2 Dec 2020 07:57:04 -0500
Received: from mail-ed1-f68.google.com ([209.85.208.68]:34446 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729854AbgLBM5D (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 2 Dec 2020 07:57:03 -0500
Received: by mail-ed1-f68.google.com with SMTP id y22so3798383edv.1;
        Wed, 02 Dec 2020 04:56:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=VtuwDJsit3T3xgKBsoLXND8jeW1ZGNw+BTf0+WVcI8I=;
        b=BLrrCZpY1snXrEJqbkFenJ5eip4bmuHSB04XapdT9TY7Ma66Q7yqEaZRLWoGSruj2l
         u+GG2UDVVXeG0b+TBkamRAJegdmcDeMgUOf3sqetGkuuRj81Xrp7K0hmu1tS/w5HbXiG
         yCeRH+9v3L9lw59NuOK4TYH9S0KpM0VpW106ttsZy7NAYTPzM/Ba6BTT9Clnk6/eoN7s
         Gnm0pnAJxc0ozoFynknwrEvekCODRPp/xeVcFX0id3Po24u8W77WaNuRyTdHf6t0Walv
         JjdeAgNJWziBrmT4rg+tRdMIueT8jklE0Mgfgqhc/3vKP9FbfFJHbc9ICCPsbfIjuXtr
         NtvA==
X-Gm-Message-State: AOAM531ZFjF4NCsScyVSkZpRHft3BUl64yqmHbc54kn4I0VX6LDQfGyz
        c9ndrC0m0T+X05HdfBpW8VU=
X-Google-Smtp-Source: ABdhPJztSHHvmB+B8TdxpT1fQBf2YKFVFozZWrKJjdolYeThkAvTszRFVp7noI+F0lL/dt4YnSMz1Q==
X-Received: by 2002:a05:6402:1c90:: with SMTP id cy16mr2412161edb.73.1606913781562;
        Wed, 02 Dec 2020 04:56:21 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.googlemail.com with ESMTPSA id g15sm1146158edj.49.2020.12.02.04.56.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Dec 2020 04:56:19 -0800 (PST)
Date:   Wed, 2 Dec 2020 14:56:18 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     linux-rtc@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH 2/2] rtc: s3c: Remove dead code related to periodic tick
 handling
Message-ID: <20201202125618.GC36340@kozik-lap>
References: <20201202111318.5353-1-m.szyprowski@samsung.com>
 <CGME20201202111328eucas1p1e6fff3706b790d104b76f95085dbb0c1@eucas1p1.samsung.com>
 <20201202111318.5353-2-m.szyprowski@samsung.com>
 <20201202124904.GB36340@kozik-lap>
 <6f29a418-6a96-4b4b-c2c4-3722f3ad9895@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <6f29a418-6a96-4b4b-c2c4-3722f3ad9895@samsung.com>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Wed, Dec 02, 2020 at 01:54:32PM +0100, Marek Szyprowski wrote:
> Hi Krzysztof,
> 
> On 02.12.2020 13:49, Krzysztof Kozlowski wrote:
> > On Wed, Dec 02, 2020 at 12:13:18PM +0100, Marek Szyprowski wrote:
> >> Support for periodic tick interrupts has been moved from the RTC class to
> >> the HR-timers long time ago. Then it has been removed from this driver by
> >> commits 80d4bb515b78 ("RTC: Cleanup rtc_class_ops->irq_set_state") and
> >> 696160fec162 ("RTC: Cleanup rtc_class_ops->irq_set_freq()"). They however
> >> did not remove all the code related to the tick handling. Do it now then.
> >>
> > Update also the bindings (one IRQ less), please.
> >
> > Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
> 
> Well, in theory bindings describe the hardware not the drivers. Hardware 
> is still capable of triggering the periodic tick interrupt. It is just a 
> Linux kernel policy not to use it at all...

Good point. It will however mean that all DTS (including new) will still
have to provide the tick IRQ. I am fine with this.

Best regards,
Krzysztof

