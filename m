Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A8B463DD3FE
	for <lists+linux-rtc@lfdr.de>; Mon,  2 Aug 2021 12:40:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233254AbhHBKkS (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 2 Aug 2021 06:40:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233081AbhHBKkS (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 2 Aug 2021 06:40:18 -0400
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com [IPv6:2607:f8b0:4864:20::835])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23698C061796
        for <linux-rtc@vger.kernel.org>; Mon,  2 Aug 2021 03:40:09 -0700 (PDT)
Received: by mail-qt1-x835.google.com with SMTP id x9so11289427qtw.13
        for <linux-rtc@vger.kernel.org>; Mon, 02 Aug 2021 03:40:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tu9oYeOBswUb031Yjp53w6z/8TnC/wbddAHGRPP+IEw=;
        b=J/+SDKEj8GHiNxWrghg4YbRnMgIBMIW/K400NCSdX819DXPsuo3psqtXqWtQKdmPFt
         Qltvp8EL5VFYapBitgCb54TiKhy4NOcgF4IPOK81OJfWdPKOJyXAHFv+rZMOmxVNRBnw
         2BF2uQh7vyLNb5N8v4a3MbnF0hlMH38kGcSpg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tu9oYeOBswUb031Yjp53w6z/8TnC/wbddAHGRPP+IEw=;
        b=jx4gwtG38fTGhG2KpvnGMBwMpGfwFHmL8FSJstLfcMvJZkYzmdIRW4kTXPcob+eXt2
         icmDqX1B7sB+WIfkbvVah4Rl1aJoksGVjrvaB0ZkvQViZkopOVnwYmQlzVJPpvtPXsG2
         xDUNMj4K6WBZK3hceaHgb0bIXoI51ZxXyFDq+fIsgaFO5HIzWpVIyQSg2J/7xT8I1c75
         C9iNxCbw1Y8AxN9a7qDkydGN6hNN6k21Uwzd9QuIVS8YmDy0ZcP0DPWkVDw+O2Nn/dDy
         uq3AVjPiN38KdqwBegt1Zue6cZwDqdNz3lx5tmi14LEiiFmdz4o1ctHWVX71+hdS/U8H
         KK3w==
X-Gm-Message-State: AOAM530dKCc92ItEyEfeSGQ0aG/qAh9euJDnKQt2+brRtdyPSz1D1wux
        4rbcZ8CL6wzth+3O7OTOfDgT5lES+6erFXqFWG2+Dg==
X-Google-Smtp-Source: ABdhPJyn3Xnoa1W0+VeBNy0IvOb6d4QL/35IsVcJxMUzim3ZLjugnsv+IftrUfL+qImfxD3tgfBm2vsw+9jR82/T28Y=
X-Received: by 2002:ac8:4f11:: with SMTP id b17mr13431338qte.33.1627900808259;
 Mon, 02 Aug 2021 03:40:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210801160921.233081-1-romain.perier@gmail.com> <20210801160921.233081-4-romain.perier@gmail.com>
In-Reply-To: <20210801160921.233081-4-romain.perier@gmail.com>
From:   Daniel Palmer <daniel@0x0f.com>
Date:   Mon, 2 Aug 2021 19:39:57 +0900
Message-ID: <CAFr9PXmqiu=toGf9DjoH8XMbPaiXaWLV=GsmR7OCkkqix5tRvw@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] ARM: dts: mstar: Add rtc device node
To:     Romain Perier <romain.perier@gmail.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>, linux-rtc@vger.kernel.org,
        DTML <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi Romain,

On Mon, 2 Aug 2021 at 01:09, Romain Perier <romain.perier@gmail.com> wrote:
> +++ b/arch/arm/boot/dts/mstar-v7.dtsi
> @@ -116,6 +116,13 @@ watchdog@6000 {
>                                 clocks = <&xtal_div2>;
>                         };
>
> +                       rtc@2400 {

I think the rtc should be before the watchdog as the address is lower.
I think maybe this got flipped around during cherry-picking.
I can flip it around when I pull this into an mstar dts for 5.15
branch so you don't need to fix it and send a v3 assuming everything
else is ok.

Thanks,

Daniel
