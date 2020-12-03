Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8ECC02CDAFC
	for <lists+linux-rtc@lfdr.de>; Thu,  3 Dec 2020 17:17:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389355AbgLCQRL (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 3 Dec 2020 11:17:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389290AbgLCQRL (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 3 Dec 2020 11:17:11 -0500
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com [IPv6:2607:f8b0:4864:20::744])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FF58C061A52
        for <linux-rtc@vger.kernel.org>; Thu,  3 Dec 2020 08:16:25 -0800 (PST)
Received: by mail-qk1-x744.google.com with SMTP id h20so2578856qkk.4
        for <linux-rtc@vger.kernel.org>; Thu, 03 Dec 2020 08:16:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=nqxHEehCvii0bTM+IyLO2PbX9ekRddRQu8/eqzIhyOU=;
        b=GAc8adqNopO2UxLM7/fwMnNg6vA9r6i6BetSSJLPScfhjerYyAldA1uJoM98PM7vBL
         rXIA6MDX/RpJeevg7cZAsDi+k9chPnnh2L0yLbbwWR23vi6WMn5gcloKgSKLfJTYmfrW
         gm0zSZzz/hea6375hJiQmOoDpMLSL19wkPQbxFDZ5ybJaS23c3MJ02FJoasFOEoRSlEK
         Nba7Nt4ZrY+Cdd1ESLexMNkeyAxOe15Iqb7BFqOr5S62iloLJ0rhPaqqfl91FCfDJ+d7
         rS9Qcj/Q6s4lLHJOaQxW5Rx/IgB5jBb6YowRC415Rr174bB20CV9MU2jQiPug/cDYbrJ
         UL8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=nqxHEehCvii0bTM+IyLO2PbX9ekRddRQu8/eqzIhyOU=;
        b=HJ3kS018RhzMjMOmb72F+FLYTml3hoSGZZCx5rv3RzWD5wCRRh4272RisFrUm6AMeL
         om8VQsiRgrZWKENvBmGk1uD5Udht97OkYbW5Uf2unAJX16Zan2DiZtEZtV3GizoXes7v
         ys7OdCG7OBMLSaKCo8jvRmrHIYpDF6QsJsYVbIlNQkCxdaeAYFAZSKEqqGCmgUMXkJRA
         FvZ0tO/5ciMfahuo32OQCP0KDtTKeO29w10EOKccyWx/9Klg3znSm3Paz2jqeArmBdQv
         vBdwK5x8nuvWHrhqlg9zudxh//ykNRyBS2n3JptFfV5raAnXCv7c70MxNM7nViJVJUI7
         MrOA==
X-Gm-Message-State: AOAM532CIOfTRSiwb+tnCnNhAJVxltl1SebJO6y4AMZxcOyadIjvInrV
        ovoEdAP0tVCHvECx3mFoTOu8GA==
X-Google-Smtp-Source: ABdhPJwpjzIsghB/Lb8L62BvOMvgFhNcU8/Mos3ye1OZbzKmjc7jOvhPfUtV9uBxJENPrsPTbTgrSA==
X-Received: by 2002:a37:5185:: with SMTP id f127mr3594869qkb.225.1607012184500;
        Thu, 03 Dec 2020 08:16:24 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net. [156.34.48.30])
        by smtp.gmail.com with ESMTPSA id j21sm1524129qtp.10.2020.12.03.08.16.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Dec 2020 08:16:23 -0800 (PST)
Received: from jgg by mlx with local (Exim 4.94)
        (envelope-from <jgg@ziepe.ca>)
        id 1kkrHK-005XLH-RZ; Thu, 03 Dec 2020 12:16:22 -0400
Date:   Thu, 3 Dec 2020 12:16:22 -0400
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Thomas Gleixner <tglx@linutronix.de>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Miroslav Lichvar <mlichvar@redhat.com>,
        linux-kernel@vger.kernel.org, John Stultz <john.stultz@linaro.org>,
        Prarit Bhargava <prarit@redhat.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-rtc@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH] rtc: adapt allowed RTC update error
Message-ID: <20201203161622.GA1317829@ziepe.ca>
References: <20201201171420.GN1900232@localhost>
 <20201201173540.GH5487@ziepe.ca>
 <87mtywe2zu.fsf@nanos.tec.linutronix.de>
 <20201202162723.GJ5487@ziepe.ca>
 <87a6uwdnfn.fsf@nanos.tec.linutronix.de>
 <20201202205418.GN5487@ziepe.ca>
 <874kl3eu8p.fsf@nanos.tec.linutronix.de>
 <87zh2vd72z.fsf@nanos.tec.linutronix.de>
 <20201203021047.GG3544@piout.net>
 <87pn3qdhli.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87pn3qdhli.fsf@nanos.tec.linutronix.de>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Thu, Dec 03, 2020 at 04:39:21PM +0100, Thomas Gleixner wrote:

> The logic in sync_cmos_clock() and rtc_set_ntp_time() is different as I
> pointed out: sync_cmos_clock() hands -500ms to rtc_tv_nsec_ok() and
> rtc_set_ntp_time() uses +500ms, IOW exactly ONE second difference in
> behaviour.

I understood this is because the two APIs work differently, rmk
explained this as:

> 1. kernel/time/ntp.c assumes that all RTCs want to be told to set the
>    time at around 500ms into the second.
>
> 2. drivers/rtc/systohc.c assumes that if the time being set is >= 500ms,
>    then we want to set the _next_ second.

ie one path is supposed to round down and one path is supposed to
round up, so you get to that 1s difference..

IIRC this is also connected to why the offset is signed..

Jason
