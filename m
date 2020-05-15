Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 209D21D570C
	for <lists+linux-rtc@lfdr.de>; Fri, 15 May 2020 19:10:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726170AbgEORKK (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 15 May 2020 13:10:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726023AbgEORKJ (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 15 May 2020 13:10:09 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 853F8C061A0C
        for <linux-rtc@vger.kernel.org>; Fri, 15 May 2020 10:10:09 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id z4so1876774wmi.2
        for <linux-rtc@vger.kernel.org>; Fri, 15 May 2020 10:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=K7Aj7pm0vIiZdtyu0H96D9hYnSt0UJrHRYiSk0qWGzY=;
        b=Lr3oxQ7a/Pj3O9fRDIrp4D6/zqj6Zra5xA4pHYa1RBLvoaiwIjAY/pgD9HR8ZwYIP2
         z2F38jPejUH4dw4c/TT846IL1ICaITGG+kNOBFw0MPYZScjBP42rR6zyNvzlQoxyjc2C
         9xxIBD6ASRQ+ELXcYOck4zGZcf000lTT//hSGCSyRlrIBHBNTkiJcScmbT+arSCdWJnG
         if1ZlHhY2x4lz4VJBNy9DTZ+cO0eY10AEBmvy0wo9797AtFtiU0jkRZzirp1G4zR8/4p
         BSnXTGCJtlM8MDQvZD8gcHk96H5kvyU0mB3qvkJpg2QpyMFZkMe1myw7UcpUgKCRovFH
         RC/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=K7Aj7pm0vIiZdtyu0H96D9hYnSt0UJrHRYiSk0qWGzY=;
        b=Cm+sKlwi/17WYsEP9a8lNtmRIJZ2UOAaJixF54ROm5LSjCyRA6yqJjForUak3z4CNT
         L3z8c3zovmP0acHv3uIfxQTlmjFsOVwJCCvc6oTPW3o6lJAy1QFUFfVv/mISblFZCPQd
         xvtEJoEYj6BERfXqrAwc9Wb5ZUrXRdhPLLCc2wqby9RlJitHeEYf40eo42c31e+aTw0X
         Psld+VZt/TIKhypXnbvLWU6OZJcoZcfi3i/e2caXMFR5Sf4fIU5Bp9zLotjoNqHE8UVc
         Ff09pBo2uw9PxuqjYZ2g30gE9TByhVyIgvt1RTUGRCM3ATE7y/zRGx9VPR8Mri1wXtQa
         TXQQ==
X-Gm-Message-State: AOAM531v0TnoGLHrcYGosPL8rWZZkEKY11d0iL67uILsi7dAT8qlbyAO
        29io9O5Y8jGOKYqaJC7sY6OtuA==
X-Google-Smtp-Source: ABdhPJz6lBYmKIWA9SC3OBG4L5ZlSmxA4dHZtdJw/MjyFZyCRehRhjAJYuQi5z57mb8sP4wzsBQsLg==
X-Received: by 2002:a1c:dd8b:: with SMTP id u133mr4851573wmg.108.1589562607152;
        Fri, 15 May 2020 10:10:07 -0700 (PDT)
Received: from linaro.org ([2a01:e34:ed2f:f020:5450:281:8a7d:dd9a])
        by smtp.gmail.com with ESMTPSA id q2sm3800278wmq.23.2020.05.15.10.10.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2020 10:10:06 -0700 (PDT)
Date:   Fri, 15 May 2020 19:10:04 +0200
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Rob Herring <robh+dt@kernel.org>, linux-mips@vger.kernel.org,
        linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 7/7] clocksource: mips-gic-timer: Set limitations on
 clocksource/sched-clocks usage
Message-ID: <20200515171004.GA760381@linaro.org>
References: <20200324174325.14213-1-Sergey.Semin@baikalelectronics.ru>
 <20200506214107.25956-1-Sergey.Semin@baikalelectronics.ru>
 <20200506214107.25956-8-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200506214107.25956-8-Sergey.Semin@baikalelectronics.ru>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Thu, May 07, 2020 at 12:41:07AM +0300, Serge Semin wrote:
> Currently neither clocksource nor scheduler clock kernel framework
> support the clocks with variable frequency. Needless to say how many
> problems may cause the sudden base clocks frequency change. In a
> simplest case the system time will either slow down or speed up.
> Since on CM2.5 and earlier MIPS GIC timer is synchronously clocked
> with CPU we must set some limitations on using it for these frameworks
> if CPU frequency may change. First of all it's not safe to have the
> MIPS GIC used for scheduler timings. So we shouldn't proceed with
> the clocks registration in the sched-subsystem. Secondly we must
> significantly decrease the MIPS GIC clocksource rating. This will let
> the system to use it only as a last resort.
>
> Note CM3.x-based systems may also experience the problems with MIPS GIC
> if the CPU-frequency change is activated for the whole CPU cluster
> instead of using the individual CPC core clocks divider.

May be there is no alternative but the code looks a bit hacksih. Isn't possible
to do something with the sched_mark_unstable?

Or just not use the timer at all ?
