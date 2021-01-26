Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C59823042B8
	for <lists+linux-rtc@lfdr.de>; Tue, 26 Jan 2021 16:37:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731528AbhAZPhl (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 26 Jan 2021 10:37:41 -0500
Received: from Galois.linutronix.de ([193.142.43.55]:50182 "EHLO
        galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391524AbhAZPgF (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 26 Jan 2021 10:36:05 -0500
From:   Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1611675318;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=hh9LYnfvfOc2Nbg2V1UNBmKMfmRSaeXdcAU2V70HUNI=;
        b=YR9XzAkZv5I5BtGuoaerm5zNmwFZWEMXzcyRPfP8FI5X+yi8+yMrmoKr0XZjCzl82fMMaP
        p/Bu8JqXkJBNkF0ns09ZxcljDcV6LdXGsEATp9dWfFrqcMkVdw+Mk1rvyO2xsuOiQ3F2zx
        CNmhOjyZQsDZJC35HovErGz59734dM66LNkFkK7H3R/fw32/yJNkp8mqgQb+QhhzReRD7N
        Di6nrp66hcx804a2DPt11mG35/W8gEpYKBVLMhaqAkK2ADQ2qwyks0Ict8HWmuo0lKxBJJ
        pwEPBHL1ZD+7eScJ8jW3XIeFNjpWHebbqDbg01h1Nr9IbalPFZDDvZecsCFCVw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1611675318;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=hh9LYnfvfOc2Nbg2V1UNBmKMfmRSaeXdcAU2V70HUNI=;
        b=dQQioqVwhhDkpZC7ZwjRyKuRi765/waHxrDDe1fMHLChPsGwjrTe9yArRH2dYUjcYq3DwC
        f37z5jcfgKGeOpAw==
To:     =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>,
        LKML <linux-kernel@vger.kernel.org>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Miroslav Lichvar <mlichvar@redhat.com>,
        John Stultz <john.stultz@linaro.org>,
        Prarit Bhargava <prarit@redhat.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-rtc@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>
Subject: Re: [patch 1/8] rtc: mc146818: Prevent reading garbage - bug
In-Reply-To: <98cb59e8-ecb4-e29d-0b8f-73683ef2bee7@digikod.net>
References: <20201206214613.444124194@linutronix.de> <20201206220541.594826678@linutronix.de> <19a7753c-c492-42e4-241a-8a052b32bb63@digikod.net> <871re7hlsg.fsf@nanos.tec.linutronix.de> <98cb59e8-ecb4-e29d-0b8f-73683ef2bee7@digikod.net>
Date:   Tue, 26 Jan 2021 16:35:18 +0100
Message-ID: <87y2gfg18p.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Tue, Jan 26 2021 at 15:17, Micka=C3=ABl Sala=C3=BCn wrote:
> Thanks for the fix! It boots now with a new message:
> rtc_cmos rtc_cmos: not accessible
>>  	spin_lock_irqsave(&rtc_lock, flags);
>> +	/* Ensure that the RTC is accessible. Bit 0-6 must be 0! */
>> +	if (WARN_ON_ONCE((CMOS_READ(RTC_VALID) & 0x7f) !=3D 0)) {
>> +		spin_unlock_irqrestore(&rtc_lock, flags);
>> +		memset(time, 0xff, sizeof(time));
>
> This should be: sizeof(*time)

Of course ....

>> +		return 0;
>> +	}
>> +
>>  	/*
>>  	 * Check whether there is an update in progress during which the
>>  	 * readout is unspecified. The maximum update time is ~2ms. Poll
>>=20
>
> Tested-by: Micka=C3=ABl Sala=C3=BCn <mic@linux.microsoft.com>
