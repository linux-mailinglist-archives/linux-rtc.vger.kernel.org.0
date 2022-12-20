Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 12FE46523DD
	for <lists+linux-rtc@lfdr.de>; Tue, 20 Dec 2022 16:43:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233849AbiLTPn4 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 20 Dec 2022 10:43:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233829AbiLTPn4 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 20 Dec 2022 10:43:56 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD17515803
        for <linux-rtc@vger.kernel.org>; Tue, 20 Dec 2022 07:43:54 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id b13so19218923lfo.3
        for <linux-rtc@vger.kernel.org>; Tue, 20 Dec 2022 07:43:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sparkcharge.io; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XXm3ehVw7jrm3viWPruU6g1/o3468ZLAkGL+jb+KseA=;
        b=GAvP7CYjU5YZu9KfvJDtO2XdFcK02W9T75Ue1qWCbvvkHjJ4rSng7AFoc66apIkhJl
         qgHn4Ddi+HeYW9p9x/UNCCttqBUmLXPoDgvy+w8zXkSFFSDkEawh/4NPN9KZmF9pLjMl
         c165HgVhP9MJuTDxG/YdcMPm8RimvBpBWTy5Nz3Ou+BeRA/YblbkYUrLAkFUSLZnJtgM
         O/0w5jOKvAcEiDvfCT2icovrwe4aXNJJ6w8JFa2h//sjyOEkS984HaViQf1ML1S5KyG3
         xOyvM0K7gV8Q008PUE/qn5hioTCaPKJ6X9/hmj/eiVjyrQeugSFbVKnT+4lr44b6QSYc
         JiAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XXm3ehVw7jrm3viWPruU6g1/o3468ZLAkGL+jb+KseA=;
        b=30FjyZ/tmjAQX3O4cLj47QA1/ed+LCXbhavNSysHUYNKbVgp+na+VlP89i3XHcW3vB
         ZAdJFXwg6qDNjZLDo9uAjvLZGtz0SzYfz6fvKuP7YNvYOCjHATi7IqAl4g7DRgnOV/6W
         KW0xFCUKuYsFbaL2WzFVrh5hBHFXOhs3SQHZ89/NhVOAkbcpMzwkcMLKr3l6+ZPFdWAX
         rGQ0PcWwovneH/Z/Ae1u0wQKbu/2VxRQrCnsjC8WUXoNIh1Rf5sJqj4nSO2xw+dZlFjz
         AELyJbMFuB0dpS4oPoD2GbKyWLp7YNHW3aq3g1EOU0PgzHiq/5t96nLL0dLatN4g7d5x
         YZwQ==
X-Gm-Message-State: ANoB5plzdP+6YXpHPQEPU9djvuHNV7zsNlpHQIjE6nPMxVF43SR11iSA
        d5WNyuEgoMGlxfE+NKvH23+kfOjoQnCG0GjUwDNn2Q==
X-Google-Smtp-Source: AA0mqf7ctVcuo3+IQBmTOqNH1YV50lLyDFdhREJWuJeakjXTQIPAz7PpODRrU1Mu3AP68oqP7fRTqZmrFiuRyMVDZ0E=
X-Received: by 2002:a05:6512:a8c:b0:4b5:a843:58cf with SMTP id
 m12-20020a0565120a8c00b004b5a84358cfmr5381314lfu.531.1671551033206; Tue, 20
 Dec 2022 07:43:53 -0800 (PST)
MIME-Version: 1.0
References: <20221219190915.3912384-1-dennis@sparkcharge.io>
 <20221219190915.3912384-3-dennis@sparkcharge.io> <a3414477-eb9b-83ee-ab11-b2b629b6d23b@linaro.org>
In-Reply-To: <a3414477-eb9b-83ee-ab11-b2b629b6d23b@linaro.org>
From:   Dennis Lambe <dennis@sparkcharge.io>
Date:   Tue, 20 Dec 2022 10:43:42 -0500
Message-ID: <CAKYiA1C7Gaw3XYYum2VUSxn=qiCzSJQ=KsSa1hx9c1MGGuv6Fw@mail.gmail.com>
Subject: Re: [PATCH 2/3] dt-bindings: m41t80: add xtal load capacitance
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
        Alexander Bigga <ab@mycable.de>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
        DKIM_SIGNED,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Tue, Dec 20, 2022 at 5:52 AM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
> > +  wakeup-source: true
>
> Why do you need it here? It's already accepted in rtc.yaml. Adding it is
> not explained in commit msg.

This shouldn't have been included in the patch, my mistake. In the
next revision of the patch series I'll take this line out. Sorry about
that, thanks for catching it.

Aside from that, does this patch look good to you? It passed
dt_binding_check and reflects my understanding of the logic needed,
but dt-binding yaml isn't something I'm super familiar with,
especially the if: not: properties: contains: enum block. The
intention is to indicate that the `quartz-load-femtofarads` property
is only applicable to the m41t82 and m41t83, but not the other devices
supported by the rtc-m41t80 driver.
-- 

Dennis Lambe (He/Him)
Lead Firmware Engineer
sparkcharge.io
