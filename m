Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 736B232FCEE
	for <lists+linux-rtc@lfdr.de>; Sat,  6 Mar 2021 20:58:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231237AbhCFT5o (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 6 Mar 2021 14:57:44 -0500
Received: from mail-pg1-f178.google.com ([209.85.215.178]:38751 "EHLO
        mail-pg1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231177AbhCFT5n (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 6 Mar 2021 14:57:43 -0500
Received: by mail-pg1-f178.google.com with SMTP id e6so3712856pgk.5;
        Sat, 06 Mar 2021 11:57:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Hmm575HorfyRVhowVRgdU0QCmJjP3xAhO8Ci7Hvo+XY=;
        b=fNMFY1FY1/zmGMgrLTFGEiczph1pMMdWOwEjw3dm0gMWYHOiqeVlA0rd71bmweHBR2
         uGnlnDJx63dFi3BnnRyBcsoamVG0PoGF6cDnzfvyb6EKT8wvYc9lG3h6KTaTCOnZQML2
         sL5sLkrdGyB5sRUkZoZkld4e4TGS+Va8nMuNeNQRl2cdVW/pNEhQ5eV+fTaZFFCstgcf
         tFkZRCmVnlE9z8+ppsUbuSeaAfbQQLGBwQlK9F40gYXL0Vz7lNxMrwOI7FGMfOd2oxhh
         wlK8WWP6hUG/0AfwXkp+lVAxmYtzaRs0fDG1Q4eDgzbNXUmZF4dnN6d5uTLC2zglAd6X
         qAbw==
X-Gm-Message-State: AOAM5309kL8ZhQyLo2DUbQg5nEKuHH2KkAqPzWnvxnMti9JolcMQZ7LY
        5esCJKS4E1oRPU+K+0ZDe0n+6ppNUbBj
X-Google-Smtp-Source: ABdhPJy7//cpr20o7A74RWsGhuPkp3ptB1ZhP+ZXC1RfZ5srLIqQv3UDqt7REpXOqtDX32CEDqfP6w==
X-Received: by 2002:a62:83ca:0:b029:1ed:78d1:531a with SMTP id h193-20020a6283ca0000b02901ed78d1531amr14563372pfe.56.1615060663350;
        Sat, 06 Mar 2021 11:57:43 -0800 (PST)
Received: from robh.at.kernel.org ([172.58.27.98])
        by smtp.gmail.com with ESMTPSA id r13sm5902565pfh.159.2021.03.06.11.57.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Mar 2021 11:57:42 -0800 (PST)
Received: (nullmailer pid 1120672 invoked by uid 1000);
        Sat, 06 Mar 2021 19:57:28 -0000
Date:   Sat, 6 Mar 2021 11:57:28 -0800
From:   Rob Herring <robh@kernel.org>
To:     Sebastian Reichel <sebastian.reichel@collabora.com>
Cc:     linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        dri-devel@lists.freedesktop.org,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        David Airlie <airlied@linux.ie>,
        Rob Herring <robh+dt@kernel.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
        kernel@collabora.com, Alessandro Zummo <a.zummo@towertech.it>
Subject: Re: [PATCHv1 3/6] dt-bindings: vendor-prefixes: add congatec
Message-ID: <20210306195728.GA1120548@robh.at.kernel.org>
References: <20210222171247.97609-1-sebastian.reichel@collabora.com>
 <20210222171247.97609-4-sebastian.reichel@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210222171247.97609-4-sebastian.reichel@collabora.com>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Mon, 22 Feb 2021 18:12:44 +0100, Sebastian Reichel wrote:
> Document binding for congatec.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
