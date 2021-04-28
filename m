Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0916036E0B3
	for <lists+linux-rtc@lfdr.de>; Wed, 28 Apr 2021 23:07:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231315AbhD1VI2 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 28 Apr 2021 17:08:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230166AbhD1VI1 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 28 Apr 2021 17:08:27 -0400
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38FA6C06138A;
        Wed, 28 Apr 2021 14:07:41 -0700 (PDT)
Received: by mail-oi1-x232.google.com with SMTP id z7so12193434oix.9;
        Wed, 28 Apr 2021 14:07:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=afGdW1IegFhA3S/ZCkNtm7XrIKzqvmxIjHYY2ZANXy8=;
        b=j9k8nqkBdnuGNgOj+Rh3eCch737NivoSBjCBKqwSjeKk35/Iab5yY6IULHN7fin/DF
         q0HClLqrQFlegmr0lbsMQyLcbn/hDM3SbyLkv4PohpL1LZf6CfaNM4XUGGEGjvqtsdSx
         bg0pjSaS63r7Jj87jHvHreCTBlwwWqMpcW7XTX2zoAns70/hU0vPw8Dy+l6/L0lAeUzj
         IiQZX7bQaP0qeRM7l35eX2fB2wNkmjCH+tSMG3F3JXJqjQG6zwQ5kmPrZ4zkL2L+YyFO
         OyR5GvEdAptwUdxZe8OeohXHe23YEeMMoxlt81fIlckuPyXnrdrX7pZijaE8YccYTK+E
         0gHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=afGdW1IegFhA3S/ZCkNtm7XrIKzqvmxIjHYY2ZANXy8=;
        b=sxLbstzb2jYdJKvu9p/uOC6xC5YF4KYeZU9o+Xrp8u67PkOTn8i36FCOOcPrE3RzxJ
         ky51HOB3eaV80+VplZ1VU6dnGjgdEe/Ag/v/8EAdMnsCEgUQrtbyXqPMSGMKdYB5QDyk
         j1pBBTJ6KEOFGC0KRZX8LvfCn+wiVHe9hCU9upfVEwO1cc20lOPVqYN895hnStTOFpZZ
         JrUOUaZfsi80tGNsZaUqLK3ga14S0ujFPfTN3TjFIqRNAltQ5F/ILebWB2E2sNO/oHgK
         W3/04CFEMO4eSdpvbtqAH1JmloRY8XHvU50TpR8cEAb6Cp4os4F37hyzqGj5TZA+Ah3C
         2fag==
X-Gm-Message-State: AOAM531Bil/zSZ5wRHEBTOjEMzLvFR8XHMQN1TRcLom3TZ+jc5MBlrgt
        c5J7+0uf/cQoNyT730aYhYp8A151XzB5NCfirCQ=
X-Google-Smtp-Source: ABdhPJz3hDhinOWSyOY7CmIXZ4pP5mqTg5SpsT+T8+gCAX93KMLvIxceeL73x9ixEeHY5VlbMG/zE9bVlBaMUBjNIls=
X-Received: by 2002:aca:3e05:: with SMTP id l5mr2353627oia.39.1619644060566;
 Wed, 28 Apr 2021 14:07:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6830:2103:0:0:0:0 with HTTP; Wed, 28 Apr 2021 14:07:39
 -0700 (PDT)
In-Reply-To: <YInDdgd2r1SDdv4k@piout.net>
References: <20210110231752.1418816-5-alexandre.belloni@bootlin.com>
 <20210428184946.23999-1-youling257@gmail.com> <YInDdgd2r1SDdv4k@piout.net>
From:   youling 257 <youling257@gmail.com>
Date:   Thu, 29 Apr 2021 05:07:39 +0800
Message-ID: <CAOzgRdbWKDxAHjUZLemsNBZsctYssyEdfMiF5YpC=nTbjsoSLg@mail.gmail.com>
Subject: Re: [PATCH 04/17] rtc: cmos: remove cmos_rtc_ops_no_alarm
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     hdegoede@redhat.com, a.zummo@towertech.it,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-rtc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

test this patch can fix my problem.

2021-04-29 4:20 GMT+08:00, Alexandre Belloni <alexandre.belloni@bootlin.com>:
> Hello,
>
> On 29/04/2021 02:49:46+0800, youling257 wrote:
>> this patch cause suspend failed on my Bay trail z3735f tablet.
>>
>> [  162.038713] PM: dpm_run_callback(): platform_pm_suspend+0x0/0x40
>> returns -22
>> [  162.038760] alarmtimer alarmtimer.0.auto: PM: failed to suspend: error
>> -22
>
> I think I know what is happening, there is one patch I wanted to send
> this cycle but didn't, can you test it?
>
> https://github.com/alexandrebelloni/linux/commit/50641a5a19cedf7561410d7db614da46c228bacc
>
> Thanks for the report!
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
