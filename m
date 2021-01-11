Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 248C82F225B
	for <lists+linux-rtc@lfdr.de>; Mon, 11 Jan 2021 23:01:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731682AbhAKWBZ (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 11 Jan 2021 17:01:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731135AbhAKWBY (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 11 Jan 2021 17:01:24 -0500
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5515FC061786
        for <linux-rtc@vger.kernel.org>; Mon, 11 Jan 2021 14:00:44 -0800 (PST)
Received: by mail-lj1-x22e.google.com with SMTP id e7so584176ljg.10
        for <linux-rtc@vger.kernel.org>; Mon, 11 Jan 2021 14:00:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jVdLysk1x6ZZsXbP0Zr5h+mMevWQuwTL1CpskBya6v8=;
        b=u4OsVlAAndy3l+Ngu/fYohy/mYFqxZDi4TLDNXDuZeeg3kChazJI9iXpzSE1HPcz3J
         UBulNCJkOdWiFliA2DuqX/vmg2SByWNgmhYs9F6nwFU7kL69aOkIMK8utFqCFoMW9Gw8
         nRTHRCtzv8cSD3n/3/R6hEg4dWPf2eXdapGk9/S6u6IQpV03ZNiontp3DtUP5s4RekbR
         h/z5F4A9AIq0Rvg381fUFmRmIYQkyRJBSDApLDdZT1yQbygM/j6lmuKKJgCEZCZDpD0A
         MnBrktjJ7LQoerAsJn3KfGe346IrqAtOZXXp/107SzHRLheTBO9SjLSojxn8uwHMUfVY
         ehzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jVdLysk1x6ZZsXbP0Zr5h+mMevWQuwTL1CpskBya6v8=;
        b=HA++3oIbodaZhGZjFZsmNGDAD4KRkSs7ohzcG5e7MfEebxbbtCCaeenrkouJUwUaOL
         t4+P48vcIzAyjFEFhaMGJWJVLbRYfhzQJ9p10kjh2SH+NKqtG3hU9hzBoZDbA2z3tOZ8
         U6wpe1tRSflggE5PBKYQPCBPrHCk82qo2aaL3Pp2ahOTn147pTcgnzT09uREHg5+BOJb
         Qjk2S4ovy53IizuKsYq1xI8Y2h7ZXz3H8J2twXhCLSrNWwm84bhDgG/x6zRFYv3mghXb
         FHrmSeDgRKRSSitlAZ216AdzHdhqTezLkJLdOeCxtIyyY13uZ0yy5zmvYC+1pwd3s+PG
         fXfg==
X-Gm-Message-State: AOAM531SJtIeKRpdUSIgFEHuYvJcRun4M++X5H0U1ZQcBvf/2P3VtzV3
        2Q3ijPzEDrRbE007cZBM2icft1X/4xqaX4vc2NAIPQ==
X-Google-Smtp-Source: ABdhPJyn6aCXyneWJOgZKxnoF9Ct2sh9Dfr16D2OhX3Out/rqGrQWppRJQJ0dfvbe8j5pKv+eDAPpyQFMjIjJbKbdMw=
X-Received: by 2002:a05:651c:1312:: with SMTP id u18mr647685lja.200.1610402441598;
 Mon, 11 Jan 2021 14:00:41 -0800 (PST)
MIME-Version: 1.0
References: <20210110231752.1418816-1-alexandre.belloni@bootlin.com> <20210110231752.1418816-3-alexandre.belloni@bootlin.com>
In-Reply-To: <20210110231752.1418816-3-alexandre.belloni@bootlin.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 11 Jan 2021 23:00:30 +0100
Message-ID: <CACRpkdaGRujF0p-57L5HgRmP=3sZOUSBfCnwAxv67dhDwiBkNQ@mail.gmail.com>
Subject: Re: [PATCH 02/17] rtc: pl031: use RTC_FEATURE_ALARM
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linuxppc-dev@lists.ozlabs.org list" <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Mon, Jan 11, 2021 at 12:18 AM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:

> Clear RTC_FEATURE_ALARM instead of setting set_alarm, read_alarm and
> alarm_irq_enable to NULL.
>
> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
