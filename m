Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F7F63AD464
	for <lists+linux-rtc@lfdr.de>; Fri, 18 Jun 2021 23:25:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233226AbhFRV1i (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 18 Jun 2021 17:27:38 -0400
Received: from mail-ot1-f52.google.com ([209.85.210.52]:34317 "EHLO
        mail-ot1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230338AbhFRV1h (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 18 Jun 2021 17:27:37 -0400
Received: by mail-ot1-f52.google.com with SMTP id w22-20020a0568304116b02904060c6415c7so11097338ott.1;
        Fri, 18 Jun 2021 14:25:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ur81CsRM61gJMJCQzXghNPExdH90iTSXlHqT7SIYiIM=;
        b=P7nd3Rw8JzT0TDVZgXSjOXWwSpF/jShcCukqiYXvQwnn7WO/1xJh49GvX3FKvRpGWd
         aclUPT36G3+6clZh9jbbYtni4SOAnhbmtqfhOQ4tL2FZlhrAzR7wLJUKOtWeUS9JUkgB
         9af+Jet2DDMv/BRXU8jX0iMXP0QltE0ipJKP9F2/JNWVd+l/VZrBhEaQqumLlqAEm4Uw
         wKpNXyZ1v+CwhX1VrhUolKlaVWaN0P4OjuFNCOOeSlltJY7J1b/y9OIAwU8QarQAKxOi
         iRm5ThNXf9e6wynLlJTfa4Bc6PO0kuZDcs+ULehjN2XdJ2wFFiZvT5/59ph0cVAYT0ce
         IO7w==
X-Gm-Message-State: AOAM531/5z/81Tq5iQbCgnWv/P52Kvfj6j5Q4i7/WB8oghnwA5dd5abF
        oDapKR2tcEj7mYRGR6O/AA==
X-Google-Smtp-Source: ABdhPJz0vkBbSfiGka1yhSTHBhgMOkQdsoFHITqiEumpIf2XLEJsfyTGlXf1zENRMCrcIs0eFNc+eg==
X-Received: by 2002:a05:6830:4106:: with SMTP id w6mr10961592ott.300.1624051527261;
        Fri, 18 Jun 2021 14:25:27 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id h17sm1671280oop.21.2021.06.18.14.25.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jun 2021 14:25:26 -0700 (PDT)
Received: (nullmailer pid 2953748 invoked by uid 1000);
        Fri, 18 Jun 2021 21:25:24 -0000
Date:   Fri, 18 Jun 2021 15:25:24 -0600
From:   Rob Herring <robh@kernel.org>
To:     Marek Vasut <marex@denx.de>
Cc:     kernel@dh-electronics.com, linux-rtc@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH V2] dt-bindings: rtc: rx8900: Convert to YAML schema
Message-ID: <20210618212524.GA2953676@robh.at.kernel.org>
References: <20210610150044.29792-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210610150044.29792-1-marex@denx.de>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Thu, 10 Jun 2021 17:00:44 +0200, Marek Vasut wrote:
> Convert the Epson RX8900 DT bindings to YAML schema.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: kernel@dh-electronics.com
> Cc: linux-rtc@vger.kernel.org
> To: devicetree@vger.kernel.org
> ---
> V2: - Switch the license to (GPL-2.0-only OR BSD-2-Clause)
> ---
>  .../devicetree/bindings/rtc/epson,rx8900.txt  | 22 ---------
>  .../devicetree/bindings/rtc/epson,rx8900.yaml | 49 +++++++++++++++++++
>  2 files changed, 49 insertions(+), 22 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/rtc/epson,rx8900.txt
>  create mode 100644 Documentation/devicetree/bindings/rtc/epson,rx8900.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
