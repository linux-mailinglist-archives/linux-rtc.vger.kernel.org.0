Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6751F2BDCC
	for <lists+linux-rtc@lfdr.de>; Tue, 28 May 2019 05:37:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727386AbfE1Dh0 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 27 May 2019 23:37:26 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:38930 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727320AbfE1Dh0 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 27 May 2019 23:37:26 -0400
Received: by mail-ed1-f66.google.com with SMTP id e24so29512121edq.6;
        Mon, 27 May 2019 20:37:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nXBj5zDqJr/Wctw+sR1zW6hq71Vo3m4QRoXtybHM4Dk=;
        b=TGiD3H6tfStdIbwWqlmLXbRNibrIkOY7u2s+tPJsevtXY0ZDvsSVK9otCsk7ylGSEE
         mtLqAMFcR9vuvKUzJK6ePUkcV9iYHKeH6nkwbM5F24hhKtlLA+G7icCjaau2VHsN+gqu
         WIGGp2x/LAxA+wSQ8XKZz8SP7R3NOfaNX1MLs1MnRJGChY6X1ICORXnmrLGiq3Ny1h4D
         Q60EmqHrspg5SYu5ckmg5b+ASv3FAOLius1nuDtXLBKjqbCpT7NT9b7lUn+5yuknaGh9
         ddBY3l1rzV77pohkKzgRl7xgtBbgo8YY9l5Dxt/7v7lQtwwLuWdj14DKeMalxgP49jlB
         bEjA==
X-Gm-Message-State: APjAAAWUZT/HW9F7ZCbZU9cV3Z5J0t2cy1afgFJsbYzA/qMLjw0onLlr
        iVFGpcNemZ05mK1BpVpOrWnaHX3dF5M=
X-Google-Smtp-Source: APXvYqz9+GRup83wOQ6RNZ7YifgVL5/FONVJEngY4G2DxUs/8NpIWZEUWScWu9qgHuLFPhMTFZqjFw==
X-Received: by 2002:a50:aed8:: with SMTP id f24mr125597549edd.214.1559014644348;
        Mon, 27 May 2019 20:37:24 -0700 (PDT)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com. [209.85.128.42])
        by smtp.gmail.com with ESMTPSA id m11sm2039747eja.41.2019.05.27.20.37.23
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 May 2019 20:37:24 -0700 (PDT)
Received: by mail-wm1-f42.google.com with SMTP id d17so1152004wmb.3;
        Mon, 27 May 2019 20:37:23 -0700 (PDT)
X-Received: by 2002:a7b:c344:: with SMTP id l4mr1312903wmj.25.1559014643559;
 Mon, 27 May 2019 20:37:23 -0700 (PDT)
MIME-Version: 1.0
References: <290402405a34506997fd2fab2c4c1486dbe6b7e5.1558958381.git-series.maxime.ripard@bootlin.com>
 <e345cb06e54ce80db07e96c2cf2ef51794130585.1558958381.git-series.maxime.ripard@bootlin.com>
In-Reply-To: <e345cb06e54ce80db07e96c2cf2ef51794130585.1558958381.git-series.maxime.ripard@bootlin.com>
From:   Chen-Yu Tsai <wens@csie.org>
Date:   Tue, 28 May 2019 11:37:14 +0800
X-Gmail-Original-Message-ID: <CAGb2v67mXr-V9_EOb7g27rguYJe2OFHoYX8HCnPnSba3AgcVAA@mail.gmail.com>
Message-ID: <CAGb2v67mXr-V9_EOb7g27rguYJe2OFHoYX8HCnPnSba3AgcVAA@mail.gmail.com>
Subject: Re: [PATCH 04/10] dt-bindings: rtc: Convert Allwinner A31 RTC to a schema
To:     Maxime Ripard <maxime.ripard@bootlin.com>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Mon, May 27, 2019 at 8:00 PM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
>
> The newer Allwinner SoCs have an embedded RTC supported in Linux, with a
> matching Device Tree binding.
>
> Now that we have the DT validation in place, let's convert the device tree
> bindings for that controller over to a YAML schemas.
>
> Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>

Without understanding the full detains of JSON schema, the new description
looks correct to me.

Acked-by: Chen-Yu Tsai <wens@csie.org>
