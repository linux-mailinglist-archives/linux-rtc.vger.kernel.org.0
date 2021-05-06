Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E977537526F
	for <lists+linux-rtc@lfdr.de>; Thu,  6 May 2021 12:35:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234453AbhEFKgJ (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 6 May 2021 06:36:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234514AbhEFKgI (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 6 May 2021 06:36:08 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A750DC0613ED
        for <linux-rtc@vger.kernel.org>; Thu,  6 May 2021 03:35:10 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id a36so6400936ljq.8
        for <linux-rtc@vger.kernel.org>; Thu, 06 May 2021 03:35:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=008lPizmeuHrx5W10oGv1XvRUscDXN1KC0lNh4i2SaM=;
        b=c7UsAnb3CmQgI4yk5wN//yVhgXXoeHeYcnak0tVrmZeYIlFkjlCen6jaclPG3TwtvE
         T34pb00F3ZTuXTDiCSSs1lmaZxHZSEu85Zvm7fZQByr3zKwSEVxNr74Aoyk5Ij36TRIu
         fYjRtDJI0CMxEBi2QOMIpRLndl2rlOUblmvNT0od04KXJwyOUenT28MqxkETVIABgo/4
         JdtnAL0FnCsTsTlYuGSgVjAskvExEwGC16BA5ev5NbtGTnh8tLMe87lKcdmyogwrnLut
         jeq7ERMKu5TmkQuQQJe+HsPK96tr3LErNpRXp+EDu5uV+5YUOqwFHMABf3N1Z9tf8ubv
         SHjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=008lPizmeuHrx5W10oGv1XvRUscDXN1KC0lNh4i2SaM=;
        b=T0/DbZQJ6ogzkL+AMHgxn9zoUi+N+NcS7einH9+nzyO5SOM8BASdh2t8tw1iGZM6fH
         ePHuhfpDlxX4FN2u/HaQY76bfga8yuSkDglrMHiT6oy5pN6Ks9/nsg8k7AZrCBckHX2n
         6ny+y8k1epC+AZI7ncBq9cPt5Mng8R9KQf8fgYzKMRzsZ8lP6st2X2IRtjYK1xqhNRfl
         O0RAnceFU5HuBZnI3lDPNkr3kfEQOk4H3F7fjvFxEhYN74kQYARf76ywuqTmdhz8mVQp
         IkZ8IaDDhDtqr7qk+9Fb3fZaHjpl7Ec2Ax3Pfupm0/G5zCgXId1yMNgEHzajXnkiqc/D
         zXog==
X-Gm-Message-State: AOAM5300L3rswLnjoltFlEO3E4QXIPK9xT2ATwp83B6fn17Zin3Qso7M
        UQIMmnvsIQO0LwycRs2iv7yB1pNnfMsM+VH/gU696Q==
X-Google-Smtp-Source: ABdhPJxqMwYZh4Nk3uCSXsZm0XhweGYNeqg/rvzKy9QH+Q/9EgDbcDl68Wpexm4l9x2R/PkDWIhYdwDw61WPVRvLObc=
X-Received: by 2002:a2e:889a:: with SMTP id k26mr2764542lji.438.1620297309219;
 Thu, 06 May 2021 03:35:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210503195048.1575007-1-clabbe@baylibre.com>
In-Reply-To: <20210503195048.1575007-1-clabbe@baylibre.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 6 May 2021 12:34:58 +0200
Message-ID: <CACRpkdb72LCHpBm-EhgJ4y68hE1=oHjL1L4m-=R5fD4FDc-WiA@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: convert rtc/faraday,ftrtc01 to yaml
To:     Corentin Labbe <clabbe@baylibre.com>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Rob Herring <robh+dt@kernel.org>,
        Hans Ulli Kroll <ulli.kroll@googlemail.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Mon, May 3, 2021 at 9:50 PM Corentin Labbe <clabbe@baylibre.com> wrote:

> Converts rtc/faraday,ftrtc01.txt to yaml.
> This permits to detect some missing properties: reg, resets, interrupts
>
> Signed-off-by: Corentin Labbe <clabbe@baylibre.com>

Thanks for doing this, LGTM
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
