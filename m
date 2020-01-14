Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 22D46139DFD
	for <lists+linux-rtc@lfdr.de>; Tue, 14 Jan 2020 01:20:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729463AbgANAUZ (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 13 Jan 2020 19:20:25 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:34096 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729457AbgANAUY (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 13 Jan 2020 19:20:24 -0500
Received: by mail-oi1-f195.google.com with SMTP id l136so10194185oig.1
        for <linux-rtc@vger.kernel.org>; Mon, 13 Jan 2020 16:20:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=nnCP/oi7Z0mxzEO5kxr1fVYeBOYXbt9IQu/uVhgHHc8=;
        b=Fslad6S6z9qPhDXUEsto5LWleJv/14+TyPqQZ1SWAMngn+rbpHH0L3LvIXnWpqGARV
         3lQq/eEHqKNFc9KwFyu61Xf567lUr5K2QZ74iDBUtGKUiFn0H2psFSRW2qnI3S7kZANO
         BsTZqcC77TXhKaKAn7/PJ8CqEEHCVji9iY7DWp0mUDZ0Mp7CV+Bzinikhsww8+agNpqw
         LqBqzlVxog2K4SMy1mh/u5PEvVvV1dAJgwjL5hdT7EeggI65nx67PyvN42EpOefTVAya
         HaZXK/dpQdUwouKZmUiDkOSBNF7ZCWqEpwjmk+XR3ZUFVnuU1SnDS3babL39vf1wDsCn
         +zsA==
X-Gm-Message-State: APjAAAWKGs5o82/+9fvDBDDUqPuJNXy773BfMFNmWDypQ6WRgbT7JhKv
        dSCoAvxokh3CGH6MlGU7K82U2rbagg==
X-Google-Smtp-Source: APXvYqy+mQpgEJUbm/U9uoBvXJQ1eUUVpfKdSYDyeXTEyiMTCkVC0WG6AnfH1sFcCmGmi9QPvuRHIg==
X-Received: by 2002:a05:6808:191:: with SMTP id w17mr14169416oic.29.1578961223194;
        Mon, 13 Jan 2020 16:20:23 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id t11sm4720571otk.50.2020.01.13.16.20.21
        for <linux-rtc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2020 16:20:22 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 2219cf
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Mon, 13 Jan 2020 18:16:49 -0600
Date:   Mon, 13 Jan 2020 18:16:49 -0600
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
Subject: Re: [PATCH v2 07/17] dt-bindings: atmel-matrix: add
 microchip,sam9x60-matrix
Message-ID: <20200114001649.GA11024@bogus>
References: <1578673089-3484-1-git-send-email-claudiu.beznea@microchip.com>
 <1578673089-3484-8-git-send-email-claudiu.beznea@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1578673089-3484-8-git-send-email-claudiu.beznea@microchip.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Fri, 10 Jan 2020 18:17:59 +0200, Claudiu Beznea wrote:
> Add microchip,sam9x60-matrix to DT bindings documentation.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
> ---
>  Documentation/devicetree/bindings/mfd/atmel-matrix.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
