Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 033076AE0A8
	for <lists+linux-rtc@lfdr.de>; Tue,  7 Mar 2023 14:35:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229975AbjCGNfy (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 7 Mar 2023 08:35:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229593AbjCGNfx (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 7 Mar 2023 08:35:53 -0500
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A50054614D
        for <linux-rtc@vger.kernel.org>; Tue,  7 Mar 2023 05:35:51 -0800 (PST)
Received: by mail-yb1-xb2b.google.com with SMTP id n18so11353751ybm.10
        for <linux-rtc@vger.kernel.org>; Tue, 07 Mar 2023 05:35:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678196151;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SuoCQcOuTdpcxwFMyiCQRw8MwyW1RKCTWVLX8zDnBP8=;
        b=oKcHU8iZbV3pKdyO74g/UsZDWJtauIlM0JK+E1M79GSeS9vNKZfWv7ZfC5+hr6fcYr
         bhtw3+Kn/P2lcY2k94skuM7ukQRprcgnltJV1J9f9+RvyzUFnc78vwv7YbLuH89QFTq5
         leSSPwlgC/dzwawrP0pbZtJ6XFxy7kQ51Do44H6otwKNJ0+abPTS7JGKJzejeD9qrg5h
         AK3hqRhRbplhj3N5363KR6Lpc8wc5YN4sZq6NF0D020g+5ZAHSHd1Jzb+KNYsVP62H8A
         dzQMeVS+/mU/Z+YSa3ZAqmEtMK/8AvgzAU/0PiXGS8iSP6PSx2Ep8kz8mxoiUHBDuqZm
         oVdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678196151;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SuoCQcOuTdpcxwFMyiCQRw8MwyW1RKCTWVLX8zDnBP8=;
        b=OBVBmNKKGuBzw0K0phvaMt5EGiMt8jxR/vGgL9F4LIaypbpaZHSrRRKDQu7iH4GrNg
         J5F5vRhPbPRA9QTvEE0hCfy7osHnyCeLklttwNu/1YWE9/XxL6a9eIaQiL372A5tKr0p
         wbNmpMEVIXmfctvWMSlmUQK2JvHOBYuVOk96hUQMl1GbbsVuvxMg/7MesnTQZ3aCXiaQ
         vfgjc6PPDXhHufrtgONCtnIZcmYnUjEjlh3BA8qCnNM4blZb4xYAiOjQMNk/+FYBfL3q
         9uLPJUAZQWeS10u3axrnfk98BX7+YbY21BD/KPQ/oX5FFvprcshkZRvfsE4GxXNlP1xY
         tgxA==
X-Gm-Message-State: AO0yUKUxX/Sh3DQ4W2vma+51qYm69JX15Bs/adxby6lpicEtJU5/yRzA
        AnRSsjpjypUVa52I4Cx3qnqIm2URT+wDfiU0wK9UFEmNb5wR9teualA=
X-Google-Smtp-Source: AK7set8DMHVxEZQ1dg1f+o1clay7yuY+eJwsWe/XT2oTmSr1Z4UenRZPGuF1PNo9djtmlvRcd+dxzMyQ5wj2vWgX0Yk=
X-Received: by 2002:a05:6902:4f4:b0:a06:5ef5:3a82 with SMTP id
 w20-20020a05690204f400b00a065ef53a82mr6798628ybs.5.1678196150859; Tue, 07 Mar
 2023 05:35:50 -0800 (PST)
MIME-Version: 1.0
References: <20230304133028.2135435-1-u.kleine-koenig@pengutronix.de> <20230304133028.2135435-13-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230304133028.2135435-13-u.kleine-koenig@pengutronix.de>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 7 Mar 2023 14:35:39 +0100
Message-ID: <CACRpkdZfzL-1gfmjo39JJVnC80gRtk6B8KCjgrbFdGuc=QMZ-w@mail.gmail.com>
Subject: Re: [PATCH 12/41] rtc: ftrtc010: Convert to platform remove callback
 returning void
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Hans Ulli Kroll <ulli.kroll@googlemail.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org,
        kernel@pengutronix.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Sat, Mar 4, 2023 at 2:30 PM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:

> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is (mostly) ignored
> and this typically results in resource leaks. To improve here there is a
> quest to make the remove callback return void. In the first step of this
> quest all drivers are converted to .remove_new() which already returns
> void.
>
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
