Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA8B035D031
	for <lists+linux-rtc@lfdr.de>; Mon, 12 Apr 2021 20:22:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244797AbhDLSWS (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 12 Apr 2021 14:22:18 -0400
Received: from mail-ot1-f42.google.com ([209.85.210.42]:46726 "EHLO
        mail-ot1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229524AbhDLSWS (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 12 Apr 2021 14:22:18 -0400
Received: by mail-ot1-f42.google.com with SMTP id d3-20020a9d29030000b029027e8019067fso11778977otb.13;
        Mon, 12 Apr 2021 11:22:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=y2ojIFbCzB5w4sgAru3oz+TxIuNqHhhz5Z30iFEHzrM=;
        b=Pa49FBawJDhpC7PlFJLT2xFyEJtFZ3BLiYedQr/ApIyoIV1+tIaVuz14ej5Vfm7q21
         ByHQ24WHXkWrd04CtJBg6IniltHgRv9y455jTMI8pi6/Srk+0wM2IEjszm0k8Q5Cz1r5
         VBrxi/t0xZr/yqIzkIgXfePkiSgeEwQDQSFY02H4jTFEcEo4NNnZ8AqusE2XdCrPO5oE
         575PMQAOoQKVEfQA/J3F2pbOIifSlnqDNx/MS2orPjYL9ag8pjEYWrW9AqTqpEoGBlLN
         bjDAMqlXVxWDPvVmXcCBxHDI2dnwKpxplN+KT3RRgeuu5baB6UW1wSDS/FTPa0LAyHzr
         +Emg==
X-Gm-Message-State: AOAM533/2HSx7O8miAOI95h3WMPRqh5+zCBJfdT9bVvFMrjrBQFNrAut
        hTqvnqP/8gBuLwJu6NTZrA==
X-Google-Smtp-Source: ABdhPJwzUuO/lylfXd1BNgdtGmIBXGSAZIaBPE79+guBs7ZCyiyjQao0qvu8qlC5tpNqZzZ6rHCpwg==
X-Received: by 2002:a05:6830:3114:: with SMTP id b20mr5948053ots.327.1618251719886;
        Mon, 12 Apr 2021 11:21:59 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id 77sm2781748otg.55.2021.04.12.11.21.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Apr 2021 11:21:59 -0700 (PDT)
Received: (nullmailer pid 4151017 invoked by uid 1000);
        Mon, 12 Apr 2021 18:21:58 -0000
Date:   Mon, 12 Apr 2021 13:21:58 -0500
From:   Rob Herring <robh@kernel.org>
To:     satya priya <skakit@codeaurora.org>
Cc:     devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        kgunda@codeaurora.org, linux-rtc@vger.kernel.org,
        Lee Jones <lee.jones@linaro.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Andy Gross <agross@kernel.org>
Subject: Re: [PATCH V2 4/4] dt-bindings: rtc: qcom-pm8xxx-rtc: Add qcom
 pm8xxx rtc bindings
Message-ID: <20210412182158.GA4150970@robh.at.kernel.org>
References: <1617976766-7852-1-git-send-email-skakit@codeaurora.org>
 <1617976766-7852-5-git-send-email-skakit@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1617976766-7852-5-git-send-email-skakit@codeaurora.org>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Fri, 09 Apr 2021 19:29:26 +0530, satya priya wrote:
> Add binding doc for qcom pm8xxx rtc device.
> 
> Signed-off-by: satya priya <skakit@codeaurora.org>
> ---
> Changes in V2:
>  - Added this in V2 to have separate binding for rtc node.
> 
>  .../devicetree/bindings/rtc/qcom-pm8xxx-rtc.yaml   | 62 ++++++++++++++++++++++
>  1 file changed, 62 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/rtc/qcom-pm8xxx-rtc.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
