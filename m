Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 00919675DB5
	for <lists+linux-rtc@lfdr.de>; Fri, 20 Jan 2023 20:12:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229897AbjATTM0 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 20 Jan 2023 14:12:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229762AbjATTMZ (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 20 Jan 2023 14:12:25 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6FD5421A
        for <linux-rtc@vger.kernel.org>; Fri, 20 Jan 2023 11:12:22 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id w11so5812610lfu.11
        for <linux-rtc@vger.kernel.org>; Fri, 20 Jan 2023 11:12:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sparkcharge.io; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bSA3wh9gMj+Mvd34uj2dtbNIbWdD9BJi2jkGKY8O+Nw=;
        b=cQAixSrgYRlylZTk1zBwdTwmpPb8cWCe1rkPu3F6V6FnCJifFUhoUsEdyDkQwata26
         Zpdo9+yWgpMs6vSDFHLsHp6w71sBnx0VSr5YHOcsafHER85JeFnMrYXS3fW3iSEGlJwc
         7IxIIm3IvK4tWlEzY4LDcZq+44Yq+y4aPHDf9kXs4HW2AmX9LdZrPh2iRHe4syc4SH0S
         N9ZP/dml6mjg+eat2j+wIfXNkgW0BWFNDrHBrMW4YJEtjapJfaW7DgnQmeyE1NEkoOb8
         4gqdfBS6Axrj/Z/uikspm49smMOUW0X2Zzgqs4EIF4KTUSIsQ84eZAfFzOgTD0OQDa1S
         BTmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bSA3wh9gMj+Mvd34uj2dtbNIbWdD9BJi2jkGKY8O+Nw=;
        b=uwFUlNFYxgTfWyMjd6nN3JpgXF+ydslqYdNHzg9BoRg0Qa7tlZsu0BRcwPy/NytSdi
         Nr0+ChaMU/W1jD2GUsb3utCrkf9i2F1VMuG4dKFEhSrmynfI0G6U/k/04iT6WrCNc8DE
         8h4z4aDdB0+g1KcjYsDJ1lXFlDAisvU78LPRO9qfLvXL3Pow/ZP92kRwIb89E9RZMAKD
         mKciqdM0FKvOO2w7rM1MxX6qaXb8pJ8cdST9Fba/ja8oTYOwWCKBvEUkDo72e6ozbLB9
         asBmyJXuZEIWWVg3k/ft9o7QFdXZUFZAZc2NTZs20oet+Jy+sc5TgAEx9fhS0fpJNRYO
         B9cg==
X-Gm-Message-State: AFqh2koGwMWVeCaIK5itjOCBNq1IghVJ87FInjC5xGK2cbRnfUkARGj9
        ByLGQu8Dyy5QHqtANjqa7AKgXs1l4n2kqDJ6wPpd2w==
X-Google-Smtp-Source: AMrXdXsmKNfhtpIFKW5CZxtAmamvdxaQgh9Nkd9XD/xUxdytFu5paVK1tK63g/5bW7BwTl2cji9jEpurDAZcsRqErp8=
X-Received: by 2002:a05:6512:39c5:b0:4d5:8faa:bfe8 with SMTP id
 k5-20020a05651239c500b004d58faabfe8mr952594lfu.277.1674241940987; Fri, 20 Jan
 2023 11:12:20 -0800 (PST)
MIME-Version: 1.0
References: <20230119213903.899756-1-dennis@sparkcharge.io>
 <Y8nBloQfBPK3t5ce@mail.local> <CAKYiA1Dr0TAmsqDf1wMeeysN4N8K+KJL6onCgQL98LVV5L7Vmg@mail.gmail.com>
 <Y8nXoZjco8uIrtFJ@mail.local>
In-Reply-To: <Y8nXoZjco8uIrtFJ@mail.local>
From:   Dennis Lambe <dennis@sparkcharge.io>
Date:   Fri, 20 Jan 2023 14:12:09 -0500
Message-ID: <CAKYiA1CTWeGPQDsNGzJwjwJgW7SGTPCH3NQ0rFqKQVHbgWh9sw@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] rtc: Set M41T82 & M41T83 xtal load capacitance
 from DT
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Atsushi Nemoto <atsushi.nemoto@sord.co.jp>,
        Gary Bisson <gary.bisson@boundarydevices.com>,
        Javier Martinez Canillas <javier@osg.samsung.com>,
        Troy Kisky <troy.kisky@boundarydevices.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
        DKIM_SIGNED,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Thu, Jan 19, 2023 at 6:52 PM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
> On 19/01/2023 18:27:44-0500, Dennis Lambe wrote:
> > 2. Analog calibration -- that's what the datasheet calls it, but the
> > range on it is very big -- 3.5 pF all the way up to 17.4 pF -- and
> > their reference design uses it as the only xtal load capacitance in
> > the circuit. Most of the values you could set for this would be wildly
> > inappropriate for any given design's choice of xtal oscillator.

I think I should start with an apology, almost everything I wrote
yesterday was in error one way or another. I was conflating this RTC
with I'm also working with. I see now that the datasheet for this one
clearly states that it's only to be used with 12.5 pF crystals, and
that the analog adjustments are meant exclusively for calibration. I
get what you mean about wanting it to be a new runtime interface and
it not making sense to put in the DeviceTree.

I also see what you mean about the datasheet not providing a good
capacitance vs. ppm table. The graph is approximate at best, and ST's
appnote recommends an iterative tuning procedure rather than just
assuming a certain value gives exactly a certain ppm adjustment. I see
why you would want to avoid using 'offset' for this.

I'll hold off on submitting any more patches for this until you've had
a chance to think about how you would want a new interface to work.
Would it be useful to you if I start working up a patchset that makes
a new rtc sysfs attribute and wires the m41t80 driver into it so that
I'm ready to adapt it to whatever naming, scaling, semantics,
interpretation, etc. you decide is right for it?

> I advocate against merging as is without more thought because changing
> anything later will mean breaking the DT ABI and this is not allowed.

Me too, thanks for taking the time to get through to me about it.
-- 

Dennis Lambe (He/Him)
Lead Firmware Engineer
sparkcharge.io
