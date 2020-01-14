Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6E87513B5C5
	for <lists+linux-rtc@lfdr.de>; Wed, 15 Jan 2020 00:27:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728884AbgANX1D (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 14 Jan 2020 18:27:03 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:36427 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728774AbgANX1C (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 14 Jan 2020 18:27:02 -0500
Received: by mail-oi1-f195.google.com with SMTP id c16so13650600oic.3
        for <linux-rtc@vger.kernel.org>; Tue, 14 Jan 2020 15:27:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ttZMLAqDhxSTsHlfd8sLeyc9soxLzGATxjf7nZzKPPw=;
        b=NcYB9tIoE3XS3l54iBhq6V+8to71rEQsTaSTTUoOiSRgVqUqhyosC6PkkcoMGYHlAr
         4a+GPaggKWAFCXDJivMGJlLudfN+JColOz9bSoE+bns0sgJiB+jSzIQL+aZ6PXeZlw61
         LGixpzzXiBUbxmdQCnHp9NYB7MRI9xyaPbGNm6BnyQRODypYncZDNA5y8DKvg/ZhlKgj
         RunvEg+3H8/ws2n1iPRkVFFBJ/0/I84cGPrXEZ9cVeZhNqexMarHDeAj3EtdqtZ9z4Lp
         MsDmzmrWkGzGj10D2N0f5oyXRloOYQmu9fJQBvRLHfte9PyKpjEhMNAyVSd1KuNIBEkw
         98mg==
X-Gm-Message-State: APjAAAV23ZqvdbjFKd5KNcFi2/GBIlJPwZQ06475uiqukhpKXhGH8D9Q
        ntEymPMSpeeYC9aIb7LKc0Y6Ka4=
X-Google-Smtp-Source: APXvYqzdaVBpjnIJFhanH65yQdw/Za2pzjKT18Ak2Jsz26t1xDDVtdjqxzuPXH7nl6xmGImDTVuXyw==
X-Received: by 2002:aca:3f54:: with SMTP id m81mr17655807oia.73.1579044422167;
        Tue, 14 Jan 2020 15:27:02 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id o20sm5047671oie.23.2020.01.14.15.27.00
        for <linux-rtc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2020 15:27:00 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 221a3a
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Tue, 14 Jan 2020 17:26:59 -0600
Date:   Tue, 14 Jan 2020 17:26:59 -0600
From:   Rob Herring <robh@kernel.org>
To:     Claudiu Beznea <claudiu.beznea@microchip.com>
Cc:     robh+dt@kernel.org, lee.jones@linaro.org, mark.rutland@arm.com,
        nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
        ludovic.desroches@microchip.com, radu_nicolae.pirea@upb.ro,
        richard.genoud@gmail.com, a.zummo@towertech.it,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-rtc@vger.kernel.org,
        Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: Re: [PATCH v3 2/7] dt-bindings: atmel-tcb: add microchip,sam9x60-tcb
Message-ID: <20200114232659.GA16642@bogus>
References: <1578997397-23165-1-git-send-email-claudiu.beznea@microchip.com>
 <1578997397-23165-3-git-send-email-claudiu.beznea@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1578997397-23165-3-git-send-email-claudiu.beznea@microchip.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Tue, 14 Jan 2020 12:23:12 +0200, Claudiu Beznea wrote:
> Add microchip,sam9x60-tcb to DT bindings documentation.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
> ---
>  Documentation/devicetree/bindings/mfd/atmel-tcb.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
