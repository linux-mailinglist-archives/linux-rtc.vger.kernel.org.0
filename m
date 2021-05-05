Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C431374BAC
	for <lists+linux-rtc@lfdr.de>; Thu,  6 May 2021 01:03:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229937AbhEEXD7 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 5 May 2021 19:03:59 -0400
Received: from mail-ot1-f43.google.com ([209.85.210.43]:40491 "EHLO
        mail-ot1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229821AbhEEXD6 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 5 May 2021 19:03:58 -0400
Received: by mail-ot1-f43.google.com with SMTP id g4-20020a9d6b040000b029029debbbb3ecso3230865otp.7;
        Wed, 05 May 2021 16:03:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=c5gJIQptNbwhzfSNPQQCVwvZ2lAYCY0SqfJ3dG+5h4k=;
        b=nwRT8+ox57GzmTlkcG3ggMaqjC76yD9q50r/u39k6wdZm+Qskmr7iz2xqodTUUAnXD
         gac5mhi/3ImUDaTc7GislH9NFyMVau+p/gzFUiIrNVE7WlJTtWMrYekR/+apd9804+hd
         JQpBbDbCR2ktdKPbpV62rAnQqCfdIieoZXCAxVKpRGgTylL0tSz4i7Rp0ddds4GP5J7E
         PxD6iBhlfQiimTpgCr9qsnZRH6+pLieaAQ1qswT4Ck23MWvYchN7XpMkLFpcUB0AbJXB
         +0b4TVPrXrnIfFbY0jwL+csE105MNyx8R2Cz45A7jELN35nYy3CluhdoNCtRyJoviWMw
         CN/A==
X-Gm-Message-State: AOAM530WJFNsmIWYr4nR7R+/y1e/nzL5HkW1Ja87KhmJUefMwtfJ0WkV
        K32HMAp/cHuFa9D4N9xqIA==
X-Google-Smtp-Source: ABdhPJwnGdYO6xivVdQOTOmieNJgXZf1cUHMK+GAA2Aak1nTUeuiCm+657685gZmMaAIiSTqypesLQ==
X-Received: by 2002:a05:6830:1556:: with SMTP id l22mr895769otp.34.1620255780165;
        Wed, 05 May 2021 16:03:00 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id e67sm126328oia.5.2021.05.05.16.02.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 May 2021 16:02:59 -0700 (PDT)
Received: (nullmailer pid 3004478 invoked by uid 1000);
        Wed, 05 May 2021 23:02:58 -0000
Date:   Wed, 5 May 2021 18:02:58 -0500
From:   Rob Herring <robh@kernel.org>
To:     Sebastian Reichel <sebastian.reichel@collabora.com>
Cc:     Saravana Kannan <saravanak@google.com>,
        Rob Herring <robh+dt@kernel.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-rtc@vger.kernel.org, linux-mtd@lists.infradead.org,
        Fabio Estevam <festevam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        linux-arm-kernel@lists.infradead.org,
        Alessandro Zummo <a.zummo@towertech.it>,
        Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
        David Airlie <airlied@linux.ie>, kernel@collabora.com,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCHv2 4/5] dt-bindings: arm: fsl: add GE B1x5pv2 boards
Message-ID: <20210505230258.GA3004449@robh.at.kernel.org>
References: <20210428222953.235280-1-sebastian.reichel@collabora.com>
 <20210428222953.235280-5-sebastian.reichel@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210428222953.235280-5-sebastian.reichel@collabora.com>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Thu, 29 Apr 2021 00:29:52 +0200, Sebastian Reichel wrote:
> Document the compatible for GE B1x5pv2 boards.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
