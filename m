Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63F671E541F
	for <lists+linux-rtc@lfdr.de>; Thu, 28 May 2020 04:45:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726773AbgE1CpE (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 27 May 2020 22:45:04 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:34818 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725896AbgE1CpE (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 27 May 2020 22:45:04 -0400
Received: by mail-io1-f65.google.com with SMTP id s18so14435863ioe.2;
        Wed, 27 May 2020 19:45:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=apsIRsU2WgwFEgExp9x1EMt5b/u3dRgtvsCAgqnV768=;
        b=NUZE7MHyvbJ916kAe69PzW8JCN2851uM/Gx7pwGPYqQ90iJ984p2l6Mrs9/WwQpEBK
         uutXHWYYZPbZpx86c23g7nq9PdYpmGUsP3rclJKSU244RS+Xz0WOUmp8cJH8eSxHIC9c
         J0zjWGwMC1GNWWg/6pCUx4/I2Tr2D6jUp83eeccEaLNcoMWKAb8qMPSSG1lRnbtyef/r
         eaakZD1Q5g2jLVgJncV/iSyjqTOnnaUEXhxncdNvPr/e+cGLL+LV2GlWBiFR5VsMGjGQ
         wlfcOQ3VfBZRC7OedcOM6F73JKeFSQWue3od4K2WGas+w7NnEoatCyDhtZD4QqnNxn/T
         HW1g==
X-Gm-Message-State: AOAM530Dry/VxeApj70FAXMlWd8Xz2t3zdMy7Z4RrAW4ShLeN2W+7N4+
        Uq4O9jMBwA8Fif7pBomRuQ==
X-Google-Smtp-Source: ABdhPJyeHUqCIiS0BrcVxSvRpTUV0/2VLwzs+2GSwkh2xJS+YMFIlV7yFk1ILvDmRlAB87p3z4lNYQ==
X-Received: by 2002:a05:6602:2408:: with SMTP id s8mr711847ioa.78.1590633902103;
        Wed, 27 May 2020 19:45:02 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id v76sm2601862ill.73.2020.05.27.19.45.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2020 19:45:01 -0700 (PDT)
Received: (nullmailer pid 3265409 invoked by uid 1000);
        Thu, 28 May 2020 02:45:00 -0000
Date:   Wed, 27 May 2020 20:45:00 -0600
From:   Rob Herring <robh@kernel.org>
To:     Anson Huang <Anson.Huang@nxp.com>
Cc:     a.zummo@towertech.it, robh+dt@kernel.org,
        devicetree@vger.kernel.org, p.bruenn@beckhoff.com,
        tremyfr@gmail.com, Linux-imx@nxp.com,
        alexandre.belloni@bootlin.com, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] dt-bindings: rtc: Convert MXC RTC V2 to json-schema
Message-ID: <20200528024500.GA3265357@bogus>
References: <1589436805-22923-1-git-send-email-Anson.Huang@nxp.com>
 <1589436805-22923-2-git-send-email-Anson.Huang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1589436805-22923-2-git-send-email-Anson.Huang@nxp.com>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Thu, 14 May 2020 14:13:25 +0800, Anson Huang wrote:
> Convert the MXC RTC V2 binding to DT schema format using json-schema.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> ---
>  .../devicetree/bindings/rtc/rtc-mxc_v2.txt         | 17 --------
>  .../devicetree/bindings/rtc/rtc-mxc_v2.yaml        | 46 ++++++++++++++++++++++
>  2 files changed, 46 insertions(+), 17 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/rtc/rtc-mxc_v2.txt
>  create mode 100644 Documentation/devicetree/bindings/rtc/rtc-mxc_v2.yaml
> 

Applied, thanks!
