Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 645DB2DEB02
	for <lists+linux-rtc@lfdr.de>; Fri, 18 Dec 2020 22:20:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726145AbgLRVUa (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 18 Dec 2020 16:20:30 -0500
Received: from mail.kernel.org ([198.145.29.99]:55040 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725846AbgLRVU3 (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Fri, 18 Dec 2020 16:20:29 -0500
X-Gm-Message-State: AOAM5313z7sM/5GRlxJ0cY4qTDx+CIOXunBm6GclyCfC4U5ziYqASZ9h
        rum/YzUyeOZpYRugJkpwmH8yZZeRBCVJEzY4dQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1608326389;
        bh=a+g5UEoM5NxyQ3jhAuGuysDaoBi8Q33J+a7X928sR4Q=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=qoxf+Q5UtAGsWkJ5xkj9v25mcsePsjG6ghd6qCzHOHRgwy2a+7rbqwfa1P5aW3MaX
         XR347v+971BNssrNpVDbpXLUZEih6hxCXl3DToDznk/58iRoxrcAUj9mFta2oDQwr3
         uZEbchQqp61uPKeq8nbjc2LhpL5e2JQovlC5HWbSih6tB/eavfCDhuuYc8wB+HTfva
         G9gCr7zWxAWVMNVNINOlPWxnzZQPvQP89KZm96cyaQ9YN7y5Dah+B14WctSxYNXc3l
         r8o3igRWoJHyaPtWKv4UkRw+ktUN/A9RsqgK8ZnJzDKhNHHkxMdIuTLoNOltiHo8OL
         rzYRrNZ/9G5cA==
X-Google-Smtp-Source: ABdhPJx8+fT17UjOQlU9nPAMzm+E52wGYx2xiG5y0kU0vonyFLY90euAUWHxhMzieLAV3mq6BLXXHJ/WPviL7X0W090=
X-Received: by 2002:a05:6402:352:: with SMTP id r18mr6198469edw.373.1608326387306;
 Fri, 18 Dec 2020 13:19:47 -0800 (PST)
MIME-Version: 1.0
References: <20201211215611.24392-1-rasmus.villemoes@prevas.dk>
 <20201218101054.25416-1-rasmus.villemoes@prevas.dk> <20201218101054.25416-2-rasmus.villemoes@prevas.dk>
In-Reply-To: <20201218101054.25416-2-rasmus.villemoes@prevas.dk>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Fri, 18 Dec 2020 15:19:35 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKZh7iKY+i6jxU+csH_dkdq=sRHff-5+C08WRQqoGnnOQ@mail.gmail.com>
Message-ID: <CAL_JsqKZh7iKY+i6jxU+csH_dkdq=sRHff-5+C08WRQqoGnnOQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: rtc: add reset-source property
To:     Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Cc:     "open list:REAL TIME CLOCK (RTC) SUBSYSTEM" 
        <linux-rtc@vger.kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, Qiang Zhao <qiang.zhao@nxp.com>,
        Bruno Thomsen <bruno.thomsen@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Fri, Dec 18, 2020 at 4:11 AM Rasmus Villemoes
<rasmus.villemoes@prevas.dk> wrote:
>
> Some RTCs, e.g. the pcf2127, can be used as a hardware watchdog. But
> if the reset pin is not actually wired up, the driver exposes a
> watchdog device that doesn't actually work.
>
> Provide a standard binding that can be used to indicate that a given
> RTC can perform a reset of the machine, similar to wakeup-source.
>
> Suggested-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Signed-off-by: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
> ---
>  Documentation/devicetree/bindings/rtc/rtc.yaml | 5 +++++
>  1 file changed, 5 insertions(+)

Reviewed-by: Rob Herring <robh@kernel.org>
