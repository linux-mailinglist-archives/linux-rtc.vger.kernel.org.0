Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0AAC0123B1B
	for <lists+linux-rtc@lfdr.de>; Wed, 18 Dec 2019 00:48:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726623AbfLQXsF (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 17 Dec 2019 18:48:05 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:41271 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726090AbfLQXsE (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 17 Dec 2019 18:48:04 -0500
Received: by mail-oi1-f194.google.com with SMTP id i1so106570oie.8;
        Tue, 17 Dec 2019 15:48:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Tutk/Fdb9yvvc0d6ClJQt0rt94NZhM3GPxr38qCafUE=;
        b=Ygyb2krK+Lix6DY2BAitTkTJTXCKcg4mokG0/mioLBt+nejJ/FPPE3zNrTRHNqPT0I
         Xf+DLBpdq2PNNXxo4QJBxQyxAA6I2Je0RLzD2HtYubFNCJBB7f+OLbrkjg2X9rT5YU8a
         Zo4r4osHfJo5Sr+UVYHlqcYRrC34K9HXLadyJh0GmYNG8N1XWjArQc0Zub4Scu9TB1JR
         FZXilE9irXoqpA4Or6OI1p0BYAF67MVGhmOHpj+Rk47BfslfjxstD6bIPiq881Znj4ca
         smDY0tPa2c3tHLhAWqyfyT4P/vdbUJLuKPCz5TOzpQp2XAVv1BC34GPfQ3zGiGAUMRm1
         ZhjA==
X-Gm-Message-State: APjAAAUNTC0/xYdU7qwdb9jCrzNhSnVekLN3n1lWYwFc5hz7P/aPDC1I
        K47xkhKPs/j/nuuBfuAapQ==
X-Google-Smtp-Source: APXvYqyP2Fiocy07OTYHl4c41Qrueem8kz4bjMPaTYDoamQglq516HtSZQh0evY8NWPhggZ/yc0W4w==
X-Received: by 2002:aca:b48a:: with SMTP id d132mr3061698oif.111.1576626483838;
        Tue, 17 Dec 2019 15:48:03 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id e9sm165102oia.10.2019.12.17.15.48.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2019 15:48:03 -0800 (PST)
Date:   Tue, 17 Dec 2019 17:48:02 -0600
From:   Rob Herring <robh@kernel.org>
To:     Benjamin Gaignard <benjamin.gaignard@st.com>
Cc:     a.zummo@towertech.it, alexandre.belloni@bootlin.com,
        robh+dt@kernel.org, mark.rutland@arm.com, alexandre.torgue@st.com,
        linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Benjamin Gaignard <benjamin.gaignard@st.com>
Subject: Re: [PATCH v2] dt-bindings: rtc: Convert stm32 rtc bindings to
 json-schema
Message-ID: <20191217234802.GA21307@bogus>
References: <20191214090025.10648-1-benjamin.gaignard@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191214090025.10648-1-benjamin.gaignard@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Sat, 14 Dec 2019 10:00:25 +0100, Benjamin Gaignard wrote:
> Convert the STM32 RTC binding to DT schema format using json-schema
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
> ---
> changes in version 2:
> - remove useless type definitions
> - move properties definitions in the core of the yaml
> 
>  .../devicetree/bindings/rtc/st,stm32-rtc.txt       |  61 ---------
>  .../devicetree/bindings/rtc/st,stm32-rtc.yaml      | 139 +++++++++++++++++++++
>  2 files changed, 139 insertions(+), 61 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/rtc/st,stm32-rtc.txt
>  create mode 100644 Documentation/devicetree/bindings/rtc/st,stm32-rtc.yaml
> 

Applied, thanks.

Rob
