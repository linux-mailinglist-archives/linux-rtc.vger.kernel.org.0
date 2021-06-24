Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD59D3B37C4
	for <lists+linux-rtc@lfdr.de>; Thu, 24 Jun 2021 22:26:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232498AbhFXU2u (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 24 Jun 2021 16:28:50 -0400
Received: from mail-io1-f48.google.com ([209.85.166.48]:42524 "EHLO
        mail-io1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230116AbhFXU2u (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 24 Jun 2021 16:28:50 -0400
Received: by mail-io1-f48.google.com with SMTP id v3so9816749ioq.9;
        Thu, 24 Jun 2021 13:26:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=rd2A9FNFySoK4ToasIbxN74ULy7rWihpEHsgyuY4Cq8=;
        b=cDcUN12uKB8mFZdYgoqCvNXDVnuHtSOf0jt1jbUqsDTCDQkvlmqRcXOSJP8y+sZYvO
         CsBgzmE/rEQqDf98fxJwzF9XAtaCZ1vELiAelik4e/HT252zNtAQuXvJOq4QPK5GfaDl
         cucwE7GTekY9cJ9pyNam4TPB+jReHEVkhl4CSowBK1gDS/nlbo/P6bbJLel7wg69i0ym
         in5Fl5ZMDpte2MEdjLeeeWJgkly8Ug5PFc1T884l48jIkBA8LcpaV2KpG1DoJnFLJSwJ
         D5LoxzBM/LyAajS6qdADBBt3p0pxva0aIaGQjO/To0Cn8N3Zfb7TqtwGSpVDy97KTdqL
         qX1g==
X-Gm-Message-State: AOAM530BXOCMc+CQH0nWPivHvp+04r+3XWFCN2Pi9UXo1G9WUTdJuxo3
        iKzXLKIRXTi2no+W8GKXxg==
X-Google-Smtp-Source: ABdhPJzSNV+JS3YYXK31IyfnOgIHpMXZjJwmglpKgP3qnYU4x0wOPile+fKEiKS+9870LHIz/kYf9g==
X-Received: by 2002:a05:6602:3407:: with SMTP id n7mr5482491ioz.129.1624566390531;
        Thu, 24 Jun 2021 13:26:30 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id s9sm2466078ilt.44.2021.06.24.13.26.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jun 2021 13:26:29 -0700 (PDT)
Received: (nullmailer pid 1932328 invoked by uid 1000);
        Thu, 24 Jun 2021 20:26:26 -0000
Date:   Thu, 24 Jun 2021 14:26:26 -0600
From:   Rob Herring <robh@kernel.org>
To:     Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        michal.simek@xilinx.com, linux-rtc@vger.kernel.org,
        alexandre.belloni@bootlin.com, a.zummo@towertech.it,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 resend] dt-bindings: rtc: zynqmp: convert bindings to
 YAML
Message-ID: <20210624202626.GA1932250@robh.at.kernel.org>
References: <20210613205022.292575-1-iwamatsu@nigauri.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210613205022.292575-1-iwamatsu@nigauri.org>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Mon, 14 Jun 2021 05:50:22 +0900, Nobuhiro Iwamatsu wrote:
> Convert Real Time Clock for Xilinx Zynq MPSoC SoC bindings documentation
> to YAML schemas.
> And this renamed the file to compatible string of DT.
> 
> Signed-off-by: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
> ---
> v3: Fix description.
>     Add $refs to calibration property.
>     Add minimum, maximum and default to calibration property.
> v2: Fix warning with DT_CHECKER_FLAGS=-m
> 
>  .../bindings/rtc/xlnx,zynqmp-rtc.yaml         | 65 +++++++++++++++++++
>  .../devicetree/bindings/rtc/xlnx-rtc.txt      | 25 -------
>  2 files changed, 65 insertions(+), 25 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/rtc/xlnx,zynqmp-rtc.yaml
>  delete mode 100644 Documentation/devicetree/bindings/rtc/xlnx-rtc.txt
> 

Applied, thanks!
