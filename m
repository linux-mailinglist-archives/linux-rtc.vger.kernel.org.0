Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A8B9139B443
	for <lists+linux-rtc@lfdr.de>; Fri,  4 Jun 2021 09:46:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230109AbhFDHsk (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 4 Jun 2021 03:48:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230036AbhFDHsk (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 4 Jun 2021 03:48:40 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EF9EC061761
        for <linux-rtc@vger.kernel.org>; Fri,  4 Jun 2021 00:46:54 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id v22so11344627lfa.3
        for <linux-rtc@vger.kernel.org>; Fri, 04 Jun 2021 00:46:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GGN1e1fZoVLsGZaUqzYtHHdtjrUyCytvAb6o6aP63HM=;
        b=msrHTL2y69s+2YhUz62/tGOY+yuNUCSTYg7AhCClV9WNnzICXVziI/JAguQAmC1wqt
         JzQYum0jXmtr+9iCgwqdBn5lLZOmJlhDXHV3wIfxkqDaA1mo3QqC5GRcYjkUpzzRYgqy
         lgo1BqhA3m4EaTUOsOwC0a99cWgorgIMboTGVgXxSCm4RcwlKx5mew8lm89LZE3E4piW
         WMJgrr2t0UVMV2Zq089Dm8Cj4hs/Uf2km5Z2XzhXJNphTurkF9AhNdmGy2WT3iN7dRrZ
         wv0LDRZbQfcfcTTvFKgoHyKAkP6iX8yEomauy5oEvl2ltflW0GY5IwrbbGMd1KUeqz3U
         cIUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GGN1e1fZoVLsGZaUqzYtHHdtjrUyCytvAb6o6aP63HM=;
        b=R0gHfqqLSHQr1ezY2Ja6GhivYNpdESfLgrVXX3FII5re7+bVsznnp/8NG2HX2p/51n
         iUX4uwG0RG2HRQoaRVs1iYZZGp/thULiybtZqkIXsgkNgrVT/f5ok15iba+rbb26rIUW
         XdgHI1C0NfFKcclOOWr90/WDpMFyv/M+rXHkY8m2EejfavuxATza7uhGAqDhg80Ws1Cm
         ilI1kAm1qSTomixPGXbgi6jOzB2FRyiRfOpet66IyPN2l1quY02A47AUi9/GZkQg9bQj
         cAPtLyuKb3MEQqHCEkQ9QACR5CiXZXunuwZNXFs9glO2vKiIso1amS9HooxwROM/kQCa
         l65g==
X-Gm-Message-State: AOAM530DMYuOBnuOcVMOFYwGGNhpJpSYiLZify8crRL+D8hLP2dyh09L
        XuWX0ScoRjh+GHT3hEmxLO9+T0ZIyMGnB+/turZDDQ==
X-Google-Smtp-Source: ABdhPJzzCT+RNeP+IY7pbsrAJ1fgWD4dRQI+FAzSlryTiYVtiWkwluM+NFAnLXRjMkG5dfHS0DGoYhOnadRzVoqCYg0=
X-Received: by 2002:a05:6512:3241:: with SMTP id c1mr2003330lfr.29.1622792812519;
 Fri, 04 Jun 2021 00:46:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210602073820.11011-1-thunder.leizhen@huawei.com> <20210602073820.11011-9-thunder.leizhen@huawei.com>
In-Reply-To: <20210602073820.11011-9-thunder.leizhen@huawei.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 4 Jun 2021 09:46:41 +0200
Message-ID: <CACRpkdZ07GnpfYM0+9XN_Gx0-boQiNSc5ZarB=3fH2w3EuOp1g@mail.gmail.com>
Subject: Re: [PATCH 8/8] rtc: ab8500: use DEVICE_ATTR_RW macro
To:     Zhen Lei <thunder.leizhen@huawei.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Joshua Kinard <kumba@gentoo.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-rtc <linux-rtc@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Wed, Jun 2, 2021 at 9:38 AM Zhen Lei <thunder.leizhen@huawei.com> wrote:

> Use DEVICE_ATTR_RW macro helper instead of plain DEVICE_ATTR, which makes
> the code a bit shorter and easier to read.
>
> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
