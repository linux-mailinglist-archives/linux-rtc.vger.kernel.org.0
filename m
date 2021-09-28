Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E8D941B018
	for <lists+linux-rtc@lfdr.de>; Tue, 28 Sep 2021 15:31:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240967AbhI1Nc7 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 28 Sep 2021 09:32:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240906AbhI1Nc5 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 28 Sep 2021 09:32:57 -0400
Received: from mail-vk1-xa2c.google.com (mail-vk1-xa2c.google.com [IPv6:2607:f8b0:4864:20::a2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D8A8C061740
        for <linux-rtc@vger.kernel.org>; Tue, 28 Sep 2021 06:31:17 -0700 (PDT)
Received: by mail-vk1-xa2c.google.com with SMTP id s137so8426615vke.11
        for <linux-rtc@vger.kernel.org>; Tue, 28 Sep 2021 06:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rQfE7KZdMhHmuIeP5K8CNc8n21oMgbxVS8aHE2vpZr0=;
        b=GBJ9+DxuBZ8tnIfVluUcbn6MWwT0n0XFm9KEV4MkSZdaXPP9ywf2wceYCUeXfTmpP1
         FnH/jo9M8QKPEQFKlRcPvUOPX6i9ripLluxFJQEL/fLwObPf9h6MRTozvTh8dmK40l1g
         BETFRGBEgcxYnEUqst4gVyRz8KOa5Cs2Fzti0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rQfE7KZdMhHmuIeP5K8CNc8n21oMgbxVS8aHE2vpZr0=;
        b=QholXfk7Cf0jpjvpV6QJo6/l1GJGd9kivQjSznAVOKwnQTKwaHIs5YGqztu+bWvczD
         n4grv1wFe7Lc9MAErzExvB8pUJPjHjTy2MWXTqsXpceE0FvJVCyBwgSq6I5EihOQuq1/
         UF7fiELSGDwC5QTEJ/bqVUKHXiHjJAflFeZlnIV3TFG7Yg6/s++o/0Wl3X6KCkdFtWD1
         OScRFN5bMxVS88ajEh4mNrYGBggqc4quGMvZvLWzhZNVptN7jR/p8m4d3/aAAYsXJFaz
         rFsdpDrbXlDG2zavg/FWnSnuQevOtsjrBYRbRYS8hr7LJl3eTgcRx1ihl5/CNdPf3Urq
         bFwg==
X-Gm-Message-State: AOAM532gIjYVBj5Z6DJ0EUmogZwjgSq9bAkogj5mlnrkIdwryHue0zhD
        EUWvS3XFmrSIxC6q+MlM84gCzlCPw9vFtOTbPZqH4w==
X-Google-Smtp-Source: ABdhPJyyl8EnZBtIDaoviw2yDgL3lnXXol+EsPgtinlw9lvoATloDRw31vE3TFI2LZd0snFAOEaao3sULK7Kul4/lZI=
X-Received: by 2002:a1f:9d09:: with SMTP id g9mr4598977vke.4.1632835876523;
 Tue, 28 Sep 2021 06:31:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210928123906.988813-1-colin.king@canonical.com>
In-Reply-To: <20210928123906.988813-1-colin.king@canonical.com>
From:   Daniel Palmer <daniel@0x0f.com>
Date:   Tue, 28 Sep 2021 22:31:06 +0900
Message-ID: <CAFr9PXnMXPmuaUnfr-VwaZDX1hY8ZDtp1+UxOau6DKpUP9FdzQ@mail.gmail.com>
Subject: Re: [PATCH][next] rtc: msc313: Fix unintentional sign extension issue
 on left shift of a u16
To:     Colin King <colin.king@canonical.com>
Cc:     Daniel Palmer <daniel@thingy.jp>,
        Romain Perier <romain.perier@gmail.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Nobuhiro Iwamatsu <iwamatsu@nigauri.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-rtc@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi Colin,

On Tue, 28 Sept 2021 at 21:39, Colin King <colin.king@canonical.com> wrote:
>Shifting the u16 value returned by readw by 16 bits to the left
>will be promoted to a 32 bit signed int and then sign-extended
>to an unsigned long. If the top bit of the readw is set then
>the shifted value will be sign extended and the top 32 bits of
>the result will be set.

Ah,.. C is fun in all the wrong places. :)
These chips are full of 32bit registers that are split into two 16
registers 4 bytes apart when seen from the ARM CPU so we probably have
this same mistake in a few other places.

A similar pattern is used a bit later on in the same file to read the counter:

seconds = readw(priv->rtc_base + REG_RTC_CNT_VAL_L)
| (readw(priv->rtc_base + REG_RTC_CNT_VAL_H) << 16);

I guess it works at the moment because the top bit won't be set until 2038.

Thanks,

Daniel
