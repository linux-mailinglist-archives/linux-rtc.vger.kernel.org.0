Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4DC02139E4F
	for <lists+linux-rtc@lfdr.de>; Tue, 14 Jan 2020 01:33:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728894AbgANAdg (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 13 Jan 2020 19:33:36 -0500
Received: from mail-oi1-f193.google.com ([209.85.167.193]:37006 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728733AbgANAdg (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 13 Jan 2020 19:33:36 -0500
Received: by mail-oi1-f193.google.com with SMTP id z64so10216023oia.4
        for <linux-rtc@vger.kernel.org>; Mon, 13 Jan 2020 16:33:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=fXJN2b85yGTyfLCLDYBimi22Hg8WM/nHD10wRzYfTm4=;
        b=aufw0wI/fhe+kNXwrChE0fIINfn4i1uewEIW48958MSd5gZBuNd8VFacHKKjEx/awc
         zbRbW5bl1My8CiYpQ86QG6VZnTaEUnyyX6PzUrbssMvJfWdx5F0J4mCG1Wgm6F9eKOGL
         1+zfoCWfMxo4k3bxMK9jQV6dIZxuisYXvQufFCJzttuczczXE0KL6HV3V5XZtGnYw9J3
         4EYI+Y+qBjYoyFN22RxUDoycKMC69gDLJwLXOBmzBBazOFiVWLcKyjWgXtFig7mK1Z4u
         QDNLyYsYNE1aX9jeN4EczuadScblF5B5okncL//JpCM6ZEkuUOpC92fMpJeAniGzdaDA
         30Mw==
X-Gm-Message-State: APjAAAWRjyWHZ+lsJaef/Rg/pQTSDB1ziLW6EDwurn/AX+58BMEMeE2P
        3FfRTixWtr9s8++EyJPuHAvjWtPXQw==
X-Google-Smtp-Source: APXvYqycbHydpzawU/6xoTOsu6wJOl2TSkirWuBf05OvmE0b91W1pLTyfB/+o8hCaieX+kRnQGrwoQ==
X-Received: by 2002:aca:f305:: with SMTP id r5mr15432040oih.174.1578962015013;
        Mon, 13 Jan 2020 16:33:35 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id v23sm3919684otj.61.2020.01.13.16.33.33
        for <linux-rtc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2020 16:33:33 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 22198d
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Mon, 13 Jan 2020 18:33:32 -0600
Date:   Mon, 13 Jan 2020 18:33:32 -0600
From:   Rob Herring <robh@kernel.org>
To:     Claudiu Beznea <claudiu.beznea@microchip.com>
Cc:     robh+dt@kernel.org, mark.rutland@arm.com,
        nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
        ludovic.desroches@microchip.com, vkoul@kernel.org,
        eugen.hristev@microchip.com, jic23@kernel.org, knaack.h@gmx.de,
        lars@metafoo.de, pmeerw@pmeerw.net, mchehab@kernel.org,
        lee.jones@linaro.org, radu_nicolae.pirea@upb.ro,
        richard.genoud@gmail.com, tudor.ambarus@microchip.com,
        miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
        wg@grandegger.com, mkl@pengutronix.de, a.zummo@towertech.it,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-iio@vger.kernel.org, linux-media@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org,
        linux-can@vger.kernel.org, linux-rtc@vger.kernel.org,
        Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: Re: [PATCH v2 15/17] dt-bindings: arm: add sam9x60-ek board
Message-ID: <20200114003332.GA3401@bogus>
References: <1578673089-3484-1-git-send-email-claudiu.beznea@microchip.com>
 <1578673089-3484-16-git-send-email-claudiu.beznea@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1578673089-3484-16-git-send-email-claudiu.beznea@microchip.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Fri, 10 Jan 2020 18:18:07 +0200, Claudiu Beznea wrote:
> Add documentation for SAM9X60-EK board.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
> ---
>  Documentation/devicetree/bindings/arm/atmel-at91.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
