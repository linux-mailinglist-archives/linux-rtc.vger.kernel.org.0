Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E44CF507CDF
	for <lists+linux-rtc@lfdr.de>; Wed, 20 Apr 2022 00:55:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243925AbiDSW6R (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 19 Apr 2022 18:58:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241646AbiDSW6O (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 19 Apr 2022 18:58:14 -0400
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E9BF37BDB
        for <linux-rtc@vger.kernel.org>; Tue, 19 Apr 2022 15:55:30 -0700 (PDT)
Received: by mail-yb1-xb34.google.com with SMTP id t67so33768545ybi.2
        for <linux-rtc@vger.kernel.org>; Tue, 19 Apr 2022 15:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xsxY8oX9n2vhciOumR/L9MXxAN7BvqpbHg8gddpFlBQ=;
        b=neBf/Se0eGJRiKmH0WGQs+AqDoywpTvICLrNtFjTzEBS2wfX3FEXjyqNRIurnI+EW1
         ty+bxfJYV7RADydNRSGgNly1aNO3B6qLVZvA7YfItvs2UwXzJ+kuPIz4V3c4uGwcquA3
         JUonsnaGwc7UNNZNxDlSi0f+wKiD1gpTadwUPfCGoV4YUGYiY05qFrYffOU22kdEUgnA
         /9F6ZgkJ7Q3e631YhyyNnVKnRpT/nlvUcAvS76L1HkG9Wnv5EVJEjrtUSv3ZlHiVH6Os
         ZktG/90399+kbfvE7rT3dz68ixKEKD0giJ0+RICo0sx3GBL2cvMl/7ktdwrl0axuIw7o
         GFnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xsxY8oX9n2vhciOumR/L9MXxAN7BvqpbHg8gddpFlBQ=;
        b=HmM6OZfqGAvkHeUSqhE73HMW9hIy7IpxKAmha7ifDE8px6cVsVEOT86yf2osfHcw+0
         KOn47Vudfw8iNEXTaTWFynmBSKewgQ48BueXvOTXlTtyrnwaZp0VQrerDnY6ef9Kzc5p
         oGnZU+RthkERO+tW3CDfmFe+1nDLwqK1u/JZ/gLelH3fYc7A8LW2DENMFxPF6UaGVN8d
         BINr37l2pVG4cWRqhmZGJNNXL4yW8wC1TeSp9hiGA4HNuYhqp6bw2OL4KoFr62rPYyAK
         SpnUBGwyA9eauahiL+SoNLCq/VzxfERYCpoCCxBkyv2lL7ZXKNRdimH8vnICdZqL46Kd
         qXmw==
X-Gm-Message-State: AOAM530M/Z8Qhjob6myoheoeAkM7GxIZKKj2QfyO6kYW9B9N8twboprf
        n1cmCTbbInjmYnEqeE43MB7CqeQdvEyRtsk18Csdig==
X-Google-Smtp-Source: ABdhPJw+LpTWRr3nJM9P//IP6dcWalVwUplUPdwIMbE3fc/ol3/PztUUh6Zef7UVPiLPvLlxW8pIXMPXNOpdAiT0meM=
X-Received: by 2002:a5b:8c8:0:b0:641:e8de:a6f4 with SMTP id
 w8-20020a5b08c8000000b00641e8dea6f4mr17247839ybq.533.1650408929528; Tue, 19
 Apr 2022 15:55:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220403054912.31739-1-linmq006@gmail.com>
In-Reply-To: <20220403054912.31739-1-linmq006@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 20 Apr 2022 00:55:18 +0200
Message-ID: <CACRpkdZsaUv+RdAMTd8KwqbLG+BwVuc25mcK4TnpOLsV6KpB6A@mail.gmail.com>
Subject: Re: [PATCH] rtc: ftrtc010: Fix error handling in ftrtc010_rtc_probe
To:     Miaoqian Lin <linmq006@gmail.com>
Cc:     Hans Ulli Kroll <ulli.kroll@googlemail.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Sun, Apr 3, 2022 at 7:49 AM Miaoqian Lin <linmq006@gmail.com> wrote:

> In the error handling path, the clk_prepare_enable() function
> call should be balanced by a corresponding 'clk_disable_unprepare()'
> call , as already done in the remove function.
>
> clk_disable_unprepare calls clk_disable() and clk_unprepare().
> They will use IS_ERR_OR_NULL to check the argument.
>
> Fixes: ac05fba39cc5 ("rtc: gemini: Add optional clock handling")
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>

Looks correct!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
