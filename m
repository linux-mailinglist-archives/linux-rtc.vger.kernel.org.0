Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C4473F5DB6
	for <lists+linux-rtc@lfdr.de>; Tue, 24 Aug 2021 14:13:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237095AbhHXMOk (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 24 Aug 2021 08:14:40 -0400
Received: from mail-oo1-f47.google.com ([209.85.161.47]:36523 "EHLO
        mail-oo1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236676AbhHXMOj (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 24 Aug 2021 08:14:39 -0400
Received: by mail-oo1-f47.google.com with SMTP id z3-20020a4a98430000b029025f4693434bso6428953ooi.3;
        Tue, 24 Aug 2021 05:13:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=KXH2+4FT2YmUfsDT7O/Je4Jc14/p7vgTI8fzfghAdso=;
        b=BqYkU48FeJtxCI/gdMwN1RsdWWlo9fHujLF18scRX/7hpM17lJu39LvX+SZEBK/DWH
         Nek/BrdeTm+f637pO0C2V4EMZeo4QX1NlYviiu39CsTqFkZcUlvyg8yIPVTjbh8bAaGm
         XMCmYdMPmjNaJTw8XEhnjOcb8eNDqQYDc/6U8zeaEZXPGJASayFMOAvkSKCa6xsvwqzo
         i7/o3TmNrn6wWwJUjojwHf1+x88p/swKrO59WJhmEA4FxNKe2v0KLCbicJBloHjOvxW6
         U7lLufWrltgL1thxeXhffrqmWFZIdj6mPRcOujKtO7JJm7vcw6/eQuOJcH4XAsW6xMva
         IlFQ==
X-Gm-Message-State: AOAM533VjLNW+YxZgpLQcAmsjRyy4iHo/Bh8HE1zOEkr5dXjsQlKo9ir
        NY9xmzuQUfJskD6t0j10Sw==
X-Google-Smtp-Source: ABdhPJzFowHmOhXdEYonOpzAvGyaulhAxmkrJcC02oheLCQweoKWE1MFuI+5KD4JvpkvWJ278Hd3Sw==
X-Received: by 2002:a4a:984c:: with SMTP id z12mr29598923ooi.78.1629807235127;
        Tue, 24 Aug 2021 05:13:55 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id v29sm4053541ooe.31.2021.08.24.05.13.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Aug 2021 05:13:54 -0700 (PDT)
Received: (nullmailer pid 23997 invoked by uid 1000);
        Tue, 24 Aug 2021 12:13:53 -0000
Date:   Tue, 24 Aug 2021 07:13:53 -0500
From:   Rob Herring <robh@kernel.org>
To:     Romain Perier <romain.perier@gmail.com>
Cc:     Daniel Palmer <daniel@0x0f.com>, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/3] dt-bindings: rtc: Add Mstar MSC313e RTC
 devicetree bindings documentation
Message-ID: <YSTigWESfHO5VLtH@robh.at.kernel.org>
References: <20210823171613.18941-1-romain.perier@gmail.com>
 <20210823171613.18941-2-romain.perier@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210823171613.18941-2-romain.perier@gmail.com>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Mon, 23 Aug 2021 19:16:11 +0200, Romain Perier wrote:
> This adds the documentation for the devicetree bindings of the Mstar
> MSC313e RTC driver, found from MSC313e SoCs and newer.
> 
> Signed-off-by: Romain Perier <romain.perier@gmail.com>
> ---
>  .../bindings/rtc/mstar,msc313-rtc.yaml        | 49 +++++++++++++++++++
>  1 file changed, 49 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/rtc/mstar,msc313-rtc.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
