Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B3A6EA340B
	for <lists+linux-rtc@lfdr.de>; Fri, 30 Aug 2019 11:32:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727718AbfH3Jb6 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-rtc@lfdr.de>); Fri, 30 Aug 2019 05:31:58 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:45200 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727236AbfH3Jb5 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 30 Aug 2019 05:31:57 -0400
Received: by mail-ed1-f65.google.com with SMTP id x19so7219923eda.12;
        Fri, 30 Aug 2019 02:31:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=quxTjiQEbSMBklWmXgExSrqlngqxZMn93Jw/def3jQU=;
        b=UxsSt0QTCQXi/nV293XOePpQzTd5LxZFmORbu/IOWpJk8Geokb+nc3ncLM9ABbJ49N
         u+NNX2PRs3NrS6c8IPq/SKBgrb3uoQWtjo0Zq61Fa51NuYdj9mEYNAEH3fJTAHt8+Wlk
         k0QFoepWSUt8G2TdFTfY/AUMz63o5zMOhfMwSouO+ksQX+ULgOH+vb168uMbVFkH0DtI
         BIAjyG/3RDXqP0067UNww8cD6bWUa23uVokzAB1FSfqlXG+NfdV3tbeAyonUzsckmZ9N
         gU1sxknTuIKqysEwrML/Lvdd2Rn7bfsNiL8HRsqcNAhtKVrd2n+Q6HaEAPCCVTP/7aBO
         kxFg==
X-Gm-Message-State: APjAAAXDqcmbP4aNZMWRaINZaBg1FERI/hY0350sfX1ygUCwjIBhJuDy
        1qDhzwPvlulXSJgHHtpDTK26S81bg+c=
X-Google-Smtp-Source: APXvYqzo4PgixqO+XU81t2yHMAS8MYLNSqk3HJx/4rQbunlItxDjnC8Pj9U5C1OIMf2y0664tC0UOw==
X-Received: by 2002:aa7:db12:: with SMTP id t18mr14440426eds.266.1567157514810;
        Fri, 30 Aug 2019 02:31:54 -0700 (PDT)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com. [209.85.221.53])
        by smtp.gmail.com with ESMTPSA id k15sm717087ejk.46.2019.08.30.02.31.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Aug 2019 02:31:54 -0700 (PDT)
Received: by mail-wr1-f53.google.com with SMTP id g7so6281506wrx.2;
        Fri, 30 Aug 2019 02:31:54 -0700 (PDT)
X-Received: by 2002:a5d:6785:: with SMTP id v5mr6428772wru.9.1567157508357;
 Fri, 30 Aug 2019 02:31:48 -0700 (PDT)
MIME-Version: 1.0
References: <20190821210056.11995-1-alejandro.gonzalez.correo@gmail.com>
In-Reply-To: <20190821210056.11995-1-alejandro.gonzalez.correo@gmail.com>
From:   Chen-Yu Tsai <wens@csie.org>
Date:   Fri, 30 Aug 2019 17:31:35 +0800
X-Gmail-Original-Message-ID: <CAGb2v64X4jbXcg1rnmmb5m=D+WUr-=Bg=6GyJckLf19jMP7PBw@mail.gmail.com>
Message-ID: <CAGb2v64X4jbXcg1rnmmb5m=D+WUr-=Bg=6GyJckLf19jMP7PBw@mail.gmail.com>
Subject: Re: [RESEND PATCH 1/1] rtc: sun6i: Allow using as wakeup source from suspend
To:     =?UTF-8?Q?Alejandro_Gonz=C3=A1lez?= 
        <alejandro.gonzalez.correo@gmail.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        linux-rtc@vger.kernel.org,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-sunxi <linux-sunxi@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Thu, Aug 22, 2019 at 5:01 AM Alejandro González
<alejandro.gonzalez.correo@gmail.com> wrote:
>
> This patch allows userspace to set up wakeup alarms on any RTC handled by the
> sun6i driver, and adds the necessary PM operations to allow resuming from
> suspend when the configured wakeup alarm fires a IRQ. Of course, that the
> device actually resumes depends on the suspend state and how a particular
> hardware reacts to it, but that is out of scope for this patch.
>
> I've tested these changes on a Pine H64 model B, which contains a
> Allwinner H6 SoC, with the help of CONFIG_PM_TEST_SUSPEND kernel option.
> These are the interesting outputs from the kernel and commands which
> show that it works. As every RTC handled by this driver is largely the
> same, I think that it shouldn't introduce any regression on other SoCs,
> but I may be wrong.
>
> [    1.092705] PM: test RTC wakeup from 'freeze' suspend
> [    1.098230] PM: suspend entry (s2idle)
> [    1.212907] PM: suspend devices took 0.080 seconds
> (The SoC freezes for some seconds)
> [    3.197604] PM: resume devices took 0.104 seconds
> [    3.215937] PM: suspend exit
>
> [    1.092812] PM: test RTC wakeup from 'mem' suspend
> [    1.098089] PM: suspend entry (deep)
> [    1.102033] PM: suspend exit
> [    1.105205] PM: suspend test failed, error -22
>
> In any case, the RTC alarm interrupt gets fired as exptected:
>
> $ echo +5 > /sys/class/rtc/rtc0/wakealarm && sleep 5 && grep rtc /proc/interrupts
>  29:          1          0          0          0     GICv2 133 Level     7000000.rtc
>
> Signed-off-by: Alejandro González <alejandro.gonzalez.correo@gmail.com>

This seems like standard PM stuff. Nothing sunxi-specific.
FWIW, for sunxi,

Acked-by: Chen-Yu Tsai <wens@csie.org>
