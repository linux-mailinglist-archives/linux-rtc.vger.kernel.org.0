Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CE66C6A9D7D
	for <lists+linux-rtc@lfdr.de>; Fri,  3 Mar 2023 18:23:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230521AbjCCRWu (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 3 Mar 2023 12:22:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231596AbjCCRWj (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 3 Mar 2023 12:22:39 -0500
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1C8948E1A
        for <linux-rtc@vger.kernel.org>; Fri,  3 Mar 2023 09:22:06 -0800 (PST)
Received: by mail-ed1-x532.google.com with SMTP id a25so13420975edb.0
        for <linux-rtc@vger.kernel.org>; Fri, 03 Mar 2023 09:22:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1677864125;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DP7vTNKcPM1bVXDUg5anR387ZbgL2nhOAlAGlClVsjk=;
        b=KmF3NDGZSwRMe7+f5y/y0k5l0SjiOKYiBKLgWjsV8/77Uh9jMFfjhBTnukLpembo8m
         CNx7ncqmHewiP6g3BUFcFn6Rc/LW60ePAeRU0Lb09xaBOVldkAN1Wxr24nlfJiUrE2J7
         zlF/UQ8axdqiaHUMzaxmiCFnj8HH1tyKeJ86U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677864125;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DP7vTNKcPM1bVXDUg5anR387ZbgL2nhOAlAGlClVsjk=;
        b=PY0d+Y6Pw85hzWspGVcU9yISXp+r7/xGiHNrqJDR0mx9vUwJcuDrEgSqJcTt2JGAka
         COgxuSVBzuwDhjgGT7Wiz+8p06AOlCrM9DpD8ndnUg1yRHNCQxEtNAQ/cOHAB6cLaorL
         2FA13jhrw3Y2rKkyc9t5Uwx6KNSWYk+8eQWSjKht3Coy5VqRqDH3/HwnF2n7MBNahs/+
         l18x1V+FTsKY5jQ2SGaRxe0DvkABxsvgu50qr0L7Ih7Ts1b96T1RA3rL+m2YswND3YmQ
         5jdWq8WudiLnn0StYiTCQi9LUv1toMNjlElPsdnyNJI8kMTSjghatkRLjvT63+e4dH7E
         OQZw==
X-Gm-Message-State: AO0yUKUWeFUhB5pCrIzZb6Xh1432A3HcKzM3j6OrW2/odat51/1elSm3
        uJkNIjFcuSr9DDBfc3lUksFdoyRiJab1LxD1T2vmQw==
X-Google-Smtp-Source: AK7set8mYuXguGKtPGLeI+SbBfPvPppTwNDO5w/HmA/NxzcjaE0L8vADOmGNb6Yix7tWJ2HuOW6jtg==
X-Received: by 2002:a17:907:1045:b0:8a6:93a4:c892 with SMTP id oy5-20020a170907104500b008a693a4c892mr2211021ejb.44.1677864125049;
        Fri, 03 Mar 2023 09:22:05 -0800 (PST)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com. [209.85.208.53])
        by smtp.gmail.com with ESMTPSA id 24-20020a170906301800b008f883765c9asm1147143ejz.136.2023.03.03.09.22.04
        for <linux-rtc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Mar 2023 09:22:04 -0800 (PST)
Received: by mail-ed1-f53.google.com with SMTP id f13so13173188edz.6
        for <linux-rtc@vger.kernel.org>; Fri, 03 Mar 2023 09:22:04 -0800 (PST)
X-Received: by 2002:a50:9fa8:0:b0:4ae:e5f1:7c50 with SMTP id
 c37-20020a509fa8000000b004aee5f17c50mr1557108edf.5.1677864123991; Fri, 03 Mar
 2023 09:22:03 -0800 (PST)
MIME-Version: 1.0
References: <2023030300024180930d7a@mail.local>
In-Reply-To: <2023030300024180930d7a@mail.local>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Fri, 3 Mar 2023 09:21:45 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjCw+NLkLcjbh9e=Pk1mV1A65m5nTTj-g7FB=Hasa3HLw@mail.gmail.com>
Message-ID: <CAHk-=wjCw+NLkLcjbh9e=Pk1mV1A65m5nTTj-g7FB=Hasa3HLw@mail.gmail.com>
Subject: Re: [GIT PULL] RTC for 6.3
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Thu, Mar 2, 2023 at 4:02=E2=80=AFPM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> I had to merge rtc-6.2-fixes that you already have to apply the last two
> patches.

Please people... Explain hat in the *merge* message too.

Now we have yet another merge with absolutely zero explanation for it.

Repeat after me: merges are commits too, and need an explanation.
Sometimes they need *more* explanation than regular commits, because
they are subtler than regular commits.

If you cannot be bothered to explain  your merge, then DO NOT DO IT.

             Linus "repeating myself" Torvalds
