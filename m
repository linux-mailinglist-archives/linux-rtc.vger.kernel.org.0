Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E933F2D8223
	for <lists+linux-rtc@lfdr.de>; Fri, 11 Dec 2020 23:33:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406923AbgLKWbr (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 11 Dec 2020 17:31:47 -0500
Received: from mail.kernel.org ([198.145.29.99]:54872 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2406945AbgLKWbQ (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Fri, 11 Dec 2020 17:31:16 -0500
X-Gm-Message-State: AOAM530Fmg2hl1SK2LafF/VfrGjBw1/n/hd/x1GRCxhkposqmOhLYux6
        zHnQaYe/SkETaDR9Nzk46qC959U31M8Mx3U9Yw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607725835;
        bh=vABCQ49+H11qfsvOTnMeJeo4wvfBhFrM6yVRi3sB2P0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Ty6zAIt4pIc6eCMnsd/2KCrtJ1I5IdiSFLqc3A8hcdAS03+v/NfUiKgqj7e19t1uc
         2sKee8OOiCfXjnNAsbUAkdzq5ctBMV5V+7zOi0iHzy350FHDwDRXHHVsCdoV49KE0R
         LX63/HrvC2Jkv1B7eawiUCruxjIrgECYgXjtyU2E+5Xk+TqHMz1pI9vWT1Yrk0AZM7
         yWAL2OBzNjEfo//qdtihjNERNOANpP+fdD+nwgW/nztkajrw3KDegdMMd8VhLwQrMM
         f/SHn/5zg+B8cIDcUxaifa3bB+scKf2CEx6p52Ys1oJD95fCj2Nib262y6PndC9xSq
         +Kt/iLLT22JIA==
X-Google-Smtp-Source: ABdhPJxELQnby/nWlpOfdvoddoRioe1RHsOXyu+dXsBt3rWuZU/yUvpL8oeessk+qqJqDe9uAXhB6SMNnfhc09IPiyk=
X-Received: by 2002:a17:906:ae43:: with SMTP id lf3mr12047822ejb.130.1607725833682;
 Fri, 11 Dec 2020 14:30:33 -0800 (PST)
MIME-Version: 1.0
References: <20201204092752.GE74177@piout.net> <20201211215611.24392-1-rasmus.villemoes@prevas.dk>
 <20201211215611.24392-2-rasmus.villemoes@prevas.dk>
In-Reply-To: <20201211215611.24392-2-rasmus.villemoes@prevas.dk>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Fri, 11 Dec 2020 16:30:22 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJ-5gwycTRQCdX=ZsefEJ=F1GyTjjDW6QB1PBynibFzLg@mail.gmail.com>
Message-ID: <CAL_JsqJ-5gwycTRQCdX=ZsefEJ=F1GyTjjDW6QB1PBynibFzLg@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: rtc: add reset-source property
To:     Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Cc:     "open list:REAL TIME CLOCK (RTC) SUBSYSTEM" 
        <linux-rtc@vger.kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, Qiang Zhao <qiang.zhao@nxp.com>,
        Bruno Thomsen <bruno.thomsen@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Fri, Dec 11, 2020 at 3:56 PM Rasmus Villemoes
<rasmus.villemoes@prevas.dk> wrote:
>
> Some RTCs, e.g. the pcf2127, can be used as a hardware watchdog. But
> if the reset pin is not actually wired up, the driver exposes a
> watchdog device that doesn't actually work.
>
> Provide a standard binding that can be used to indicate that a given
> RTC can perform a reset of the machine, similar to wakeup-source.

Why not use the watchdog 'timeout-sec' property?

Please send DT patches to the DT list.

>
> Suggested-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Signed-off-by: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
> ---
>  Documentation/devicetree/bindings/rtc/rtc.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/rtc/rtc.yaml b/Documentation/devicetree/bindings/rtc/rtc.yaml
> index ee237b2ed66a..b5e24dc24b0b 100644
> --- a/Documentation/devicetree/bindings/rtc/rtc.yaml
> +++ b/Documentation/devicetree/bindings/rtc/rtc.yaml
> @@ -47,4 +47,9 @@ properties:
>      description:
>        Enables wake up of host system on alarm.
>
> +  reset-source:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description:
> +      The RTC is able to reset the machine.
> +
>  ...
> --
> 2.23.0
>
