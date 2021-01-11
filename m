Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9EC912F0FC7
	for <lists+linux-rtc@lfdr.de>; Mon, 11 Jan 2021 11:13:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728912AbhAKKNc (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 11 Jan 2021 05:13:32 -0500
Received: from Galois.linutronix.de ([193.142.43.55]:37678 "EHLO
        galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728862AbhAKKNc (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 11 Jan 2021 05:13:32 -0500
From:   Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1610359970;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=ELTMBG/piRAicwVwlOp7eFBbH/3LfbXixUnmMHwZ0aU=;
        b=HZ46lrmNU50/Ja+TXetTWLzIGyNL3iCTC+111NZ66zJcLdRR+VvPrdeicua+9JryMz/xHF
        vVCyry0uZFyq/sen8wJbQFwNyz8FNfaRdkmbYc00YI0L8O/VmPWMCnGjIsw2jLJLoQSgLe
        fcGuKEW9ooraOxoGoADUILWsp6u7ccqDGV4FxhBurS7scQJQhVLWZXpNruScnSK021gAOx
        EGFCbyEPYKIr6TFuNOcZAw07STaKNrDXgiob747cvPznPEGmb+faHkceFyirf58Pz4bmoD
        Qoi6cNxy+XSwFmcGI8cF7WIvlbq9k7CiZisiqLTSR5OmEyur7ftE3v6EdHRmww==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1610359970;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=ELTMBG/piRAicwVwlOp7eFBbH/3LfbXixUnmMHwZ0aU=;
        b=36FA3kIrpGPfrJHjkJusvwimGZcvZLrNY8NvUZvKJGO8tl2GxvJBc8x9sjJWa8AT60h7mP
        2mFYFVj+1kv4iUCg==
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Miroslav Lichvar <mlichvar@redhat.com>,
        John Stultz <john.stultz@linaro.org>,
        Prarit Bhargava <prarit@redhat.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-rtc@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [patch 5/8] ntp: Make the RTC synchronization more reliable
In-Reply-To: <CAMuHMdVB9XMAaMDnKrRzkqvhFugrDGmj=00Vh5sDQT-idnA7DA@mail.gmail.com>
References: <20201206214613.444124194@linutronix.de> <20201206220542.062910520@linutronix.de> <CAMuHMdVB9XMAaMDnKrRzkqvhFugrDGmj=00Vh5sDQT-idnA7DA@mail.gmail.com>
Date:   Mon, 11 Jan 2021 11:12:49 +0100
Message-ID: <87lfcz7pem.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Tue, Dec 29 2020 at 20:41, Geert Uytterhoeven wrote:
> Hi Thomas,
>> Reported-by: Miroslav Lichvar <mlichvar@redhat.com>
>> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
>
> Thanks for your patch, which is now commit c9e6189fb03123a7 ("ntp: Make
> the RTC synchronization more reliable").
>
> Since this commit, the I2C RTC on the R-Car M2-W Koelsch development
> board is accessed every two seconds.  Sticking a WARN() in the I2C
> activation path gives e.g.

Huch? Every two seconds? The timer is armed with 11 * 60 * NSEC_PER_SEC,
which is 11 minutes. Confused....

Thanks,

        tglx
