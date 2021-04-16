Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B400362B11
	for <lists+linux-rtc@lfdr.de>; Sat, 17 Apr 2021 00:29:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235377AbhDPW32 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 16 Apr 2021 18:29:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233514AbhDPW32 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 16 Apr 2021 18:29:28 -0400
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com [IPv6:2607:f8b0:4864:20::829])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4C44C061574
        for <linux-rtc@vger.kernel.org>; Fri, 16 Apr 2021 15:29:02 -0700 (PDT)
Received: by mail-qt1-x829.google.com with SMTP id z15so13887890qtj.7
        for <linux-rtc@vger.kernel.org>; Fri, 16 Apr 2021 15:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:content-transfer-encoding:date:message-id:from:to:cc
         :subject:references:in-reply-to;
        bh=Oeqq8zcVL+zOo3n1ROUzAQL1eQJlHVO7WOhXt/kQhC4=;
        b=lmyeupMH/yNqTQEcqluLnV/leIcjXIrbipWB2tq2jeiEY65qg0gDrd9kt5un8Hw7b9
         dTFez3Lfvxa+SXywmj7gdh3pdUdG9oql8eUtDL3cc50VzIEQmq3x2qawNnXgKHnChNFA
         JriajihiMMNvbsopFXIAZNS5X0sHzi67GyS1zwwChBhbr8av/mBFPqUsiIZEmlzbOpeR
         bSaCKS8yvHpkqXF4IfKlPIseyUQFD4sEoKs/rVK8JjUuqSGj5YkVkug6Lz2x2M6oaWkm
         j0Ay1g0HIED4X+jSpZMHmzJgJdIwt2snHwjfQmA6mlgW/9sYdhQrdrdf+Vm42QsmKiCn
         8/sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding:date
         :message-id:from:to:cc:subject:references:in-reply-to;
        bh=Oeqq8zcVL+zOo3n1ROUzAQL1eQJlHVO7WOhXt/kQhC4=;
        b=kVXA96cMJ1oxKp5wZsB49g+M+YQMMPqORkKwWO1ia/S53XqoUwVG4NtUN0MB586MZF
         mIcGX0jCpiVB2jSa86B5srFyLy5EjKebEdKck9+QZCRLQvyAjScPzfYWiqgx62xhxJZp
         3+ESnHPbcLwgRQZelyB6cMPCoKlI0iOUs2DIRMRNWeI3S7k7btrRCHx88h5HAPX7agNu
         frB/GmA39E61KbxnB7GA2FT/mk1PNM8hhnIBUYe7TjNcLaMHGeGMyS7AHxC2cH44brz5
         mt7x67PeftQrmpnL1VdyJTCge8jWlJFXpYoGUg16NrburJgDn63e7R6B/zzg9Ue7icfT
         2mPg==
X-Gm-Message-State: AOAM530X7LnJgMKYoxaUkAIlVnVCFmd77sOcXC+9hoKrTfYjP80wPxO0
        CJ2h0r1PzRke87s9Fp1XGX2r8vS1mhgRCw==
X-Google-Smtp-Source: ABdhPJyibHXmjM6JTpgvSAEGBxqUB76yhEN+Yxcr634a3UJS82mRnQnmavZJc+by995x2U1ZVZVSgg==
X-Received: by 2002:ac8:7586:: with SMTP id s6mr1324899qtq.94.1618612142126;
        Fri, 16 Apr 2021 15:29:02 -0700 (PDT)
Received: from localhost (198-48-202-89.cpe.pppoe.ca. [198.48.202.89])
        by smtp.gmail.com with ESMTPSA id u64sm1732790qkc.127.2021.04.16.15.29.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Apr 2021 15:29:01 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Fri, 16 Apr 2021 18:29:00 -0400
Message-Id: <CAPI4825CYHA.CUPT2Q9T1TUY@shaak>
From:   "Liam Beguin" <liambeguin@gmail.com>
To:     "Alexandre Belloni" <alexandre.belloni@bootlin.com>,
        <a.zummo@towertech.it>, <panfilov.artyom@gmail.com>
Cc:     <linux-rtc@vger.kernel.org>
Subject: Re: [PATCH v2 0/3] add alarm support for the rtc-ab-eoz9
References: <20210408024028.3526564-1-liambeguin@gmail.com>
 <161861084945.863955.12310930275996788222.b4-ty@bootlin.com>
In-Reply-To: <161861084945.863955.12310930275996788222.b4-ty@bootlin.com>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Fri Apr 16, 2021 at 6:09 PM EDT, Alexandre Belloni wrote:
> On Wed, 7 Apr 2021 22:40:25 -0400, Liam Beguin wrote:
> > Add alarm support for the rtc-ab-eoz9.
> >=20
> > The board used to test this series has the interrupt line of the RTC
> > connected to a circuit controlling the power of the board.
> >=20
> > An event on the interrupt line while the board is off will power it on.
> > Because of these hardware limitations, the irq handler added in this
> > patch wasn't fully tested.
> >=20
> > [...]
>
> Applied, thanks!
>
> [1/3] rtc: ab-eoz9: set regmap max_register
> commit: f1d304766c7f5388239d273fc0b72efa62acd9ca
> [2/3] rtc: ab-eoz9: add alarm support
> commit: e70e52e1bf1d6d0ea60e2f8294d5e76a8d8f5370
> [3/3] rtc: ab-eoz9: make use of RTC_FEATURE_ALARM
> commit: c52409eb16672907804b7acf1658bb1fd9dcb426
>
> I would still have preferred the last two to be squashed but I've been
> slow to
> reply and we are late in the cyle.
>

Understood, I'll squash them next time.

Thanks,
Liam

> Best regards,
> --
> Alexandre Belloni <alexandre.belloni@bootlin.com>

