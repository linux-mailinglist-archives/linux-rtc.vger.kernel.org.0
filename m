Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6AA737EE65
	for <lists+linux-rtc@lfdr.de>; Thu, 13 May 2021 00:58:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239114AbhELVmq (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 12 May 2021 17:42:46 -0400
Received: from mail-ot1-f48.google.com ([209.85.210.48]:40548 "EHLO
        mail-ot1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1385235AbhELUHl (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 12 May 2021 16:07:41 -0400
Received: by mail-ot1-f48.google.com with SMTP id t4-20020a05683014c4b02902ed26dd7a60so11527056otq.7;
        Wed, 12 May 2021 13:06:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=MJeDIa2NnmHqarnc2FOL8873WIQ1NCrn5b1K3y9ZYQg=;
        b=KD+L2sE736sKpbAihoLAP7J8YnNYOX1qbWpvtSDRS590J51KQLs8fp7WiAtGSiq2ma
         Af82E7GU1f74h5qTpexRhUSYOa1baYQOn976lmMLzOcDQBgti4VJCHwEHuEZAnH56rCP
         Qy7rdC9MF6BevnDivHhupvAH01SWmjxGXlxAYqJcBr+hM539pzVVOsLa/HwiFlF/uYo9
         gfWjBLFx7k9TfdISuDOZkGKQIOd4GCXiyMo9BKftBemk/IktEn0Bwaip9Fh20jVT6onY
         xTu6HtCSboF3+w5nr17YspssI8IV3WSSnuc74wcbNCXvmMZxyUTWmn2ISbb+RIllPgwK
         7Fzg==
X-Gm-Message-State: AOAM5308Akiec3fPvhxjkRXr+1bcyZ2qpRVjK+LORYGr+hGHFl5L2M27
        lyKjSFUH3XDySd60SAa32g==
X-Google-Smtp-Source: ABdhPJxlNUpP2Ejlcq8XMNNalsjJz1DxjYloB50EN7sEIQKo/5wdJRIya2JpYebDs0Foh3mjLV7OOA==
X-Received: by 2002:a05:6830:1656:: with SMTP id h22mr32583995otr.371.1620849992903;
        Wed, 12 May 2021 13:06:32 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id s85sm223794oos.4.2021.05.12.13.06.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 May 2021 13:06:32 -0700 (PDT)
Received: (nullmailer pid 2432849 invoked by uid 1000);
        Tue, 11 May 2021 19:03:11 -0000
Date:   Tue, 11 May 2021 14:03:11 -0500
From:   Rob Herring <robh@kernel.org>
To:     Corentin Labbe <clabbe@baylibre.com>
Cc:     ulli.kroll@googlemail.com, linux-arm-kernel@lists.infradead.org,
        robh+dt@kernel.org, a.zummo@towertech.it,
        linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, alexandre.belloni@bootlin.com,
        linus.walleij@linaro.org
Subject: Re: [PATCH v2] dt-bindings: convert rtc/faraday,ftrtc01 to yaml
Message-ID: <20210511190311.GA2432796@robh.at.kernel.org>
References: <20210510182505.3968936-1-clabbe@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210510182505.3968936-1-clabbe@baylibre.com>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Mon, 10 May 2021 18:25:05 +0000, Corentin Labbe wrote:
> Converts rtc/faraday,ftrtc01.txt to yaml.
> This permits to detect some missing properties: reg, resets, interrupts
> 
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
> ---
> Changes since v1:
> - fixed issues reported by Rob Herring https://lore.kernel.org/linux-rtc/20210506174539.GA536770@robh.at.kernel.org/T/#t
>  .../bindings/rtc/faraday,ftrtc010.txt         | 28 ---------
>  .../bindings/rtc/faraday,ftrtc010.yaml        | 59 +++++++++++++++++++
>  2 files changed, 59 insertions(+), 28 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/rtc/faraday,ftrtc010.txt
>  create mode 100644 Documentation/devicetree/bindings/rtc/faraday,ftrtc010.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
