Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0364374BA4
	for <lists+linux-rtc@lfdr.de>; Thu,  6 May 2021 01:01:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230228AbhEEXCI (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 5 May 2021 19:02:08 -0400
Received: from mail-oi1-f170.google.com ([209.85.167.170]:43933 "EHLO
        mail-oi1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230175AbhEEXCI (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 5 May 2021 19:02:08 -0400
Received: by mail-oi1-f170.google.com with SMTP id j75so3729862oih.10;
        Wed, 05 May 2021 16:01:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=2t7KI7LfK5f/FnHiV9rDrMTIJlm24ZGWJejB3IMlcwI=;
        b=dTsC/8DjQUlahdRiBEXEYLz7UiJw9LBCNcIBMz/JmEDRNRIBs8tsRVI3/u9vwWdhG+
         Urt0pVEsPt/JqeDpU6jRQH3IP3d0XizuIhia0jKq0fbiZDTlWxPrnAN7ABblVmavD28X
         Kh3S3/ksQQkGagiNKkYChFG/mWOw4AUjOG2vQmFKipO538S7F84InBPwP0O1K6IIUmRg
         O1XEeSmVxl/ZEH0T3f1a0mb5C/8R97vZ1VXLFpWZiOKYPDynKQH4HszvHFqpVO4m0btp
         TeUmWl3AIL0hDLp1ZRcqteY4M00kMtRtsjOnUdBSrh04Fa0LBBrKdTsQE/mjvk3PF1mz
         5tgQ==
X-Gm-Message-State: AOAM530d6B23Mse3lJ4lyN2NFelb/2q2jJKvsrlBsdBAx8eRztz7rHhi
        m4SjAPBKipl4Dk8IV36S8IpE68Q5bQ==
X-Google-Smtp-Source: ABdhPJwqSOXRvGO7rMRB/1QA3ZzGYWjxV1j2PQ/ar6QmazCIHQeBzFb80UuwGfZaOP8RQ6MfH1OcLA==
X-Received: by 2002:aca:48d5:: with SMTP id v204mr8307187oia.7.1620255669496;
        Wed, 05 May 2021 16:01:09 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id m67sm190792otm.69.2021.05.05.16.01.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 May 2021 16:01:08 -0700 (PDT)
Received: (nullmailer pid 3001472 invoked by uid 1000);
        Wed, 05 May 2021 23:01:06 -0000
Date:   Wed, 5 May 2021 18:01:06 -0500
From:   Rob Herring <robh@kernel.org>
To:     Sebastian Reichel <sebastian.reichel@collabora.com>
Cc:     Shawn Guo <shawnguo@kernel.org>, linux-rtc@vger.kernel.org,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Fabio Estevam <festevam@gmail.com>, kernel@collabora.com,
        Philipp Zabel <p.zabel@pengutronix.de>,
        dri-devel@lists.freedesktop.org,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org, Saravana Kannan <saravanak@google.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        linux-mtd@lists.infradead.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-arm-kernel@lists.infradead.org,
        David Airlie <airlied@linux.ie>,
        Alessandro Zummo <a.zummo@towertech.it>
Subject: Re: [PATCHv2 3/5] dt-bindings: vendor-prefixes: add congatec
Message-ID: <20210505230106.GA3001442@robh.at.kernel.org>
References: <20210428222953.235280-1-sebastian.reichel@collabora.com>
 <20210428222953.235280-4-sebastian.reichel@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210428222953.235280-4-sebastian.reichel@collabora.com>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Thu, 29 Apr 2021 00:29:51 +0200, Sebastian Reichel wrote:
> Document binding for congatec.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
