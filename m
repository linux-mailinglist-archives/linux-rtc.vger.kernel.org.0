Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE83032FCF2
	for <lists+linux-rtc@lfdr.de>; Sat,  6 Mar 2021 20:58:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231335AbhCFT6R (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 6 Mar 2021 14:58:17 -0500
Received: from mail-pf1-f169.google.com ([209.85.210.169]:44976 "EHLO
        mail-pf1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231177AbhCFT6Q (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 6 Mar 2021 14:58:16 -0500
Received: by mail-pf1-f169.google.com with SMTP id t29so4435188pfg.11;
        Sat, 06 Mar 2021 11:58:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=vrwdJhhYtSH9wQZ5EXhp7heMqxOYZiFZDSvmiyJutDA=;
        b=VYIDyOwTkNfI4gHYu5pPKfzj/Bs6v7UZ/+REk4bJDl11Lg1RX5ICO/8jrr3AMffHp1
         6S27IlH3ThvGv08QXztnWvZULQdFrItBIyfr9HbyFGucOGRma44LSws2rKFCy01bwGpW
         yrLnWlSghJGMvtzyDfWIKvMTB0CVXbI27TkdFPSzbejfcWHJpBNLqRB5BVbMfioomOYT
         6B2i7LHsSdjln/nM3K3NB3IwWB2V6gKgesCw9Zbx2B04qscpSkW+y93Vizhjp4eEnIBx
         QM3Ni9JFpp6gOUsTK871VeGn4ATk4rfSOpVvuz3m+UQYAdU8jRoZGD4VrsZXLJ+Egvsm
         2j8Q==
X-Gm-Message-State: AOAM530a5z0WhHHUwpUe2C7IIYMwIvzm/bRYqafLctPhChdzndPujVDc
        58Qd5rBa9ckEfgCmKY4Q8g==
X-Google-Smtp-Source: ABdhPJyIkD3xwASyiv2hONK661jHJeeDgt+7b9ZQTNaf1Ja9t99WvD8XURjwe4kk7/XbL2T2N/XhCA==
X-Received: by 2002:a62:b50d:0:b029:1ed:c0d:3778 with SMTP id y13-20020a62b50d0000b02901ed0c0d3778mr14784437pfe.72.1615060696520;
        Sat, 06 Mar 2021 11:58:16 -0800 (PST)
Received: from robh.at.kernel.org ([172.58.27.98])
        by smtp.gmail.com with ESMTPSA id t6sm775470pjs.26.2021.03.06.11.58.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Mar 2021 11:58:15 -0800 (PST)
Received: (nullmailer pid 1121697 invoked by uid 1000);
        Sat, 06 Mar 2021 19:58:08 -0000
Date:   Sat, 6 Mar 2021 11:58:08 -0800
From:   Rob Herring <robh@kernel.org>
To:     Sebastian Reichel <sebastian.reichel@collabora.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        linux-arm-kernel@lists.infradead.org,
        Sascha Hauer <s.hauer@pengutronix.de>,
        David Airlie <airlied@linux.ie>,
        Shawn Guo <shawnguo@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-mtd@lists.infradead.org, linux-rtc@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>, kernel@collabora.com,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        dri-devel@lists.freedesktop.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCHv1 4/6] dt-bindings: arm: fsl: add GE B1x5pv2 boards
Message-ID: <20210306195808.GA1121640@robh.at.kernel.org>
References: <20210222171247.97609-1-sebastian.reichel@collabora.com>
 <20210222171247.97609-5-sebastian.reichel@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210222171247.97609-5-sebastian.reichel@collabora.com>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Mon, 22 Feb 2021 18:12:45 +0100, Sebastian Reichel wrote:
> Document the compatible for GE B1x5pv2 boards.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
