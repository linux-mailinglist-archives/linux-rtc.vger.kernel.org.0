Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 497A92D4243
	for <lists+linux-rtc@lfdr.de>; Wed,  9 Dec 2020 13:41:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731645AbgLIMkO (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 9 Dec 2020 07:40:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730658AbgLIMkN (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 9 Dec 2020 07:40:13 -0500
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95001C0613D6;
        Wed,  9 Dec 2020 04:39:33 -0800 (PST)
From:   Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1607517571;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=8dwJm9i+sZuX9i1dJaYNT1K16m6IDpoHujVnVF8WBbs=;
        b=t74yzOU9F/4HONEju0GOVxNBIzOUBjU0YjqTgXBCiU24TwkuWKF9prjJ+DhzpNSRwBo/1Q
        kZHt4D58rOu/qz/JOnpk+mD4ZjBSsxFH0upvN3CYEzoGSFTA2mTuv+HfxP55HF9strbVGX
        vOdKAlWRtACzg0COM4ocXU+CGLsfDfF8fILF7vDOYgqeFNxcWvcSSPbux7CZ+9+n24Cwy9
        ID2pu2BFnEoqoYKizbCygObjXHJLMlAPJgHkCmUZjosc85etfwFkeYxmDf0mmu23CawRos
        n2SL+um4E8jTZW1VEF/IRza0Fuxpt6rTF2rCGhT5n4Zim1CSRacueVH3cuH9cA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1607517571;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=8dwJm9i+sZuX9i1dJaYNT1K16m6IDpoHujVnVF8WBbs=;
        b=Dbf9X9v/wxujrvdviejtJlqZYiIccpz2KLv/h8pMTWiujCFv4oqIYxAPMgtrxSytz4Ce6z
        XomtmPkqjTRPmODg==
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Miroslav Lichvar <mlichvar@redhat.com>,
        John Stultz <john.stultz@linaro.org>,
        Prarit Bhargava <prarit@redhat.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-rtc@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>
Subject: Re: [patch 0/8] ntp/rtc: Fixes and cleanups
In-Reply-To: <20201209040155.GB1245199@piout.net>
References: <20201206214613.444124194@linutronix.de> <87sg8f24zf.fsf@nanos.tec.linutronix.de> <20201209040155.GB1245199@piout.net>
Date:   Wed, 09 Dec 2020 13:39:31 +0100
Message-ID: <875z5b17cs.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Wed, Dec 09 2020 at 05:01, Alexandre Belloni wrote:
> On 09/12/2020 01:33:08+0100, Thomas Gleixner wrote:
>> > The following series addresses the above:
>> >
>> >     1) Fix the readout function of MC146818
>> >     2) Fix the rtc-cmos offset
>> >     3) Reduce the default transport time
>> >
>> >     4) Switch the NTP periodic sync code to a hrtimer/work combo
>> >
>> >     5) Move rtc_set_npt_time() to the ntp code
>> >     6) Make the update offset more intuitive
>> >     7) Simplify the whole machinery
>> 
>> any opinion on this?
>> 
> This looks very good to me, however, I think the 10ms offset is a bit
> too much.

I pulled it out of thin air TBH. It's at least 50 times more accurate
than what we had before :)

> Do you mind waiting one or two days so I can get my test setup
> back up?

No problem.

Thanks,

        tglx
