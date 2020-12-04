Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F0F52CEF6A
	for <lists+linux-rtc@lfdr.de>; Fri,  4 Dec 2020 15:09:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388063AbgLDOJE (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 4 Dec 2020 09:09:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388020AbgLDOJD (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 4 Dec 2020 09:09:03 -0500
Received: from mail-qv1-xf43.google.com (mail-qv1-xf43.google.com [IPv6:2607:f8b0:4864:20::f43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AB53C061A51
        for <linux-rtc@vger.kernel.org>; Fri,  4 Dec 2020 06:08:23 -0800 (PST)
Received: by mail-qv1-xf43.google.com with SMTP id q7so2760995qvt.12
        for <linux-rtc@vger.kernel.org>; Fri, 04 Dec 2020 06:08:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=YqXEsirEh9eW1VieGHrEu+QlOdgfjHIxDQpQJ3ZI1GQ=;
        b=DPaWF+yuM+abHWkSEYzIkGbG1X9C5nWRMqwqGsjVNKBOJ5Mev2u4CyIsRihFZaouda
         Xshhb+mFTlVQS+EZJT7mTRyRcMy5eGQLGYJT/txdBMgiSlL3t2F1G4DmPneafNsuCgkt
         QKtR/RClMRZDqiOHJd5qW74+iYZ1MQvjVJtJpNjMEvtpO4+9/GQrTTNFB+D+OfEG+2mQ
         xK6Q5JWuu9NzOhFZWJELZ7FYaJqiZpkuWwtL4ICswr6IRW+AuPWpuV2GykIwQHF2SueD
         TtnBa860pGMhACWpqHCwKgezk4pEPUAGKvhQVTz3baGPTTErwjY+fvjG4rEukkZIr1hN
         drLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=YqXEsirEh9eW1VieGHrEu+QlOdgfjHIxDQpQJ3ZI1GQ=;
        b=EtFiMC048962Ctj+TTefsqsqxSHniTIlWytIo0lILVJeucclY3wfrq+1S5yB+ytst5
         4FW6jxHq9Mkkb9kU6f9GJAUjsZ+WK8ZWc6k/bCNu4Ljl9GBCNy/XiFA9VkyySM5uRvNn
         4GlY9/rQNqBj/O4dPwPxzZUEHhe+9hLD1Vr/8dhOOIPbMnM4C6TKHwObCFMhyMBRlHl2
         dFtN02uZojXyu25bUq+sphVBgM8roMRQNraMcpp2J6iGgUGRAcFSzqKWXbRb6mmSItnz
         r23ZAPSAu/gwwHAtUKW9GeuqQYIOWJ8TWqi4oi0ZJSa40O5+m6wyJoSB3mOrYoOOfWOo
         YXzA==
X-Gm-Message-State: AOAM531fh1jhAFYoi05p015SLsCyw7j0tUtR3ToNJezfjJgtxWG0Ssql
        lx3chH4AlGm4Rd0HrKGKqkPMtA==
X-Google-Smtp-Source: ABdhPJwNYN3wZEVkLRcCz859RCC5SVfMWP4iSwbgNtFU+yM6gv1YTpTw/ichnblG5iK5AJgxJ9fd0w==
X-Received: by 2002:a0c:e0c9:: with SMTP id x9mr5318505qvk.56.1607090902137;
        Fri, 04 Dec 2020 06:08:22 -0800 (PST)
Received: from ziepe.ca ([206.223.160.26])
        by smtp.gmail.com with ESMTPSA id q28sm5022865qkn.39.2020.12.04.06.08.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Dec 2020 06:08:20 -0800 (PST)
Received: from jgg by mlx with local (Exim 4.94)
        (envelope-from <jgg@ziepe.ca>)
        id 1klBkx-005s5c-Kz; Fri, 04 Dec 2020 10:08:19 -0400
Date:   Fri, 4 Dec 2020 10:08:19 -0400
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Thomas Gleixner <tglx@linutronix.de>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Miroslav Lichvar <mlichvar@redhat.com>,
        linux-kernel@vger.kernel.org, John Stultz <john.stultz@linaro.org>,
        Prarit Bhargava <prarit@redhat.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-rtc@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH] rtc: adapt allowed RTC update error
Message-ID: <20201204140819.GX5487@ziepe.ca>
References: <20201202205418.GN5487@ziepe.ca>
 <874kl3eu8p.fsf@nanos.tec.linutronix.de>
 <87zh2vd72z.fsf@nanos.tec.linutronix.de>
 <20201203021047.GG3544@piout.net>
 <87pn3qdhli.fsf@nanos.tec.linutronix.de>
 <20201203161622.GA1317829@ziepe.ca>
 <87zh2ubny2.fsf@nanos.tec.linutronix.de>
 <87wnxybmqx.fsf@nanos.tec.linutronix.de>
 <20201203223646.GA1335797@ziepe.ca>
 <877dpxbu66.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <877dpxbu66.fsf@nanos.tec.linutronix.de>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Fri, Dec 04, 2020 at 02:02:57PM +0100, Thomas Gleixner wrote:

> No magic sign calculation required if you look at it from the actual
> timeline and account the time between write and next second increment
> correctly.

Yes, it is equivalent to break things into two values, and does look
to be more understandable as one can read at least one of the values
from a datasheet and the other could be estimated by timing a read
clock

Jason
