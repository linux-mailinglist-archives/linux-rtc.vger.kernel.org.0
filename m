Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C47AB3D114D
	for <lists+linux-rtc@lfdr.de>; Wed, 21 Jul 2021 16:26:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239222AbhGUNqF (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 21 Jul 2021 09:46:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238592AbhGUNpw (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 21 Jul 2021 09:45:52 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A903C06179A
        for <linux-rtc@vger.kernel.org>; Wed, 21 Jul 2021 07:26:21 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id s13so3404800lfi.12
        for <linux-rtc@vger.kernel.org>; Wed, 21 Jul 2021 07:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Y5IdCRJZdJYIiudXPCqxlRKiC6LdgtZkGmH8rRPhgTM=;
        b=DfZty/Ixt/tbCkEATYd7Xctiu3ogAgN3WD/IwiROnkAKSZv3xwTODhlTlCT8Xi3nv1
         Dg1qfPy20ffG87fs1hWVi3Q25QSj0diOYe09xTXjyv6um8idOFHt/ZXV3rgZe9NgqdN1
         yEyzWn9IBYZGP9L8EmDpmRxNpbXAYwqRXc8AEIlWBl5F5mpmMfVKsuonN3B9ProzGngQ
         FtKpxS++Sb9F9gquqZzPud504nw7wq++64NoUphdP3fwj8uB/e3VLCpXjjacCc5sBbNu
         oeiMP8oGGghMnRlAM06pfMf3TdJGTqA5LoVQu6KZaJXAzorOV5PfOVReFX+O2e/HD2OK
         PL4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Y5IdCRJZdJYIiudXPCqxlRKiC6LdgtZkGmH8rRPhgTM=;
        b=aqKJX+/0TnQ4rbRNeGaY3iDAVTkunhjSjBBmuaW9rthqtmkKAfstWYyxUoQQxx30u5
         yGKdzcM+LHhjQWA4+hUe7qt3DHCBMqKREMPFKOXn0D09YxyVEgAYlXwE023v9P+AfEYI
         yXRMqHF7c7WuViDtQNM+jVRUqiamPozPgWC97T268SW5pyyd4TQJgqvwQjxY8ppahHiT
         euYrepzDsx6MP8P1gy/rt1ZdLEckoaxIYtwPooXLTSrSp7etrgM0Bx2kZSJ7b7SjGcQW
         gNH3J/FMSxhdvgh74723Hfx2VP2R8kvOo7AiZk1NtQ7fLKpiDPwhj1yqIhFJqo21cJYR
         4YzQ==
X-Gm-Message-State: AOAM532yTvX1GfmfnQoBuHq39lxuwoRqoTL93FD2aqcA0E7UwQjd+6Li
        yOnmCrw4W0OQ78i8VfbeE/Hiz3Jto93EJiKW2qhJiw==
X-Google-Smtp-Source: ABdhPJxLJxuektkYlmThnTeKs9wi2CGTur5nFPRKxrsRGLrNNjiiMAw1eN/JZqtaD96z1vToql3upVxtxcQHSW4GACE=
X-Received: by 2002:a05:6512:169e:: with SMTP id bu30mr5421776lfb.291.1626877579556;
 Wed, 21 Jul 2021 07:26:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210720172025.363238-1-robh@kernel.org>
In-Reply-To: <20210720172025.363238-1-robh@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 21 Jul 2021 16:26:08 +0200
Message-ID: <CACRpkdZdm=ArA3H86iHwmhLnCtTePxCtuik8O+bOhDBPMXOP=A@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: Remove "status" from schema examples
To:     Rob Herring <robh@kernel.org>
Cc:     "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Robert Marko <robert.marko@sartura.hr>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Ramesh Shanmugasundaram <rashanmu@gmail.com>,
        "G. Jaya Kumaran" <vineetha.g.jaya.kumaran@intel.com>,
        Oleksij Rempel <o.rempel@pengutronix.de>,
        ChiYuan Huang <cy_huang@richtek.com>,
        Wei Xu <xuwei5@hisilicon.com>,
        Dilip Kota <eswara.kota@linux.intel.com>,
        Karol Gugala <kgugala@antmicro.com>,
        Mateusz Holenko <mholenko@antmicro.com>,
        Olivier Moysan <olivier.moysan@st.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        netdev <netdev@vger.kernel.org>,
        linux-rtc <linux-rtc@vger.kernel.org>,
        "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..." 
        <alsa-devel@alsa-project.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Tue, Jul 20, 2021 at 7:20 PM Rob Herring <robh@kernel.org> wrote:

> There's no reason to have "status" properties in examples. "okay" is the
> default, and "disabled" turns off some schema checks ('required'
> specifically).

All of mine are mistakes anyway.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Thanks for fixing this up.

Yours,
Linus Walleij
