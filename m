Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 14590718E66
	for <lists+linux-rtc@lfdr.de>; Thu,  1 Jun 2023 00:26:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229955AbjEaW0h (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 31 May 2023 18:26:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229476AbjEaW0h (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 31 May 2023 18:26:37 -0400
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97C309F
        for <linux-rtc@vger.kernel.org>; Wed, 31 May 2023 15:26:35 -0700 (PDT)
Received: by mail-yb1-xb36.google.com with SMTP id 3f1490d57ef6-b9e6ec482b3so125710276.3
        for <linux-rtc@vger.kernel.org>; Wed, 31 May 2023 15:26:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google; t=1685571995; x=1688163995;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DvXHIjun/4CTxosApTF0PYo6iJjE95CYydLIVwhHBQg=;
        b=kInfsUOhJGIjEQmHeu9bzEPw7jRfiajattPrD+9hK3VxkDn7HlXPId6k947qP+Da1j
         /8gF2rM+IGwsKG4DHnmBuUtw0rdGiO+tktJnlTwJMayVNGzcsHRKBqouvfJm7WSVMV8E
         M0bFNopLBWMZSIuJw50r5NJ9FCQAfktsQHHFc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685571995; x=1688163995;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DvXHIjun/4CTxosApTF0PYo6iJjE95CYydLIVwhHBQg=;
        b=goSGFttra+BX+3UMVMg1Hv/ahRbbsOD5gAjayuqYlhlij/t88VmX5Gn+PECnuTR0w6
         2H6/ZBdgnF2KUbVbCkuFBBbfWqPw7UqntuKMfyL1WUQfFZfENJQIczdpY4KgaplDap1A
         pTC5zXHasHYl5Q0tkbw8AkNTNVH7qv+e2VNFKgQDybVOOak3aaU/TiH4jb2kkVrxOP4p
         2EAcPrpVlMays7mCOjU2zFheT7qAVfCtHNaaPQIGXq4lH3MnD6KdmvraAzqjQ/xQjnR+
         3WZ+xQLKBlGrHvA4gNpJFy8K5VZE9JDVFuy9Raxy1AebWLNE1nIr39ybrvZWeGWhiB+I
         WdcA==
X-Gm-Message-State: AC+VfDxp5+vCt2CbYMMw1OLgJFSS7d8Sa9OQX4C9pds9s2xTiz3M5S5M
        yDwNjUp3rE/KJGUtjUQN7v3rRNtfAVro5ZdhUrFY7Q==
X-Google-Smtp-Source: ACHHUZ5PypSnPvHyFqawOE8bJ8rbG/2ckwXMp1s1Rnn27JB5Y5ROJzT40uFNfOrXCRRtfNnP0e6pCQY4ECp0UtD/bmE=
X-Received: by 2002:a25:385:0:b0:ba1:dfba:1d12 with SMTP id
 127-20020a250385000000b00ba1dfba1d12mr8259813ybd.29.1685571994849; Wed, 31
 May 2023 15:26:34 -0700 (PDT)
MIME-Version: 1.0
References: <20230517144144.365631-1-romain.perier@gmail.com>
 <20230517144144.365631-3-romain.perier@gmail.com> <669d7b79-71a6-e1f9-8d7a-71c4b64de28d@kernel.org>
 <CABgxDoKaVip=T5=s2Gd8qpX15cLD=_0TZtQoNodK1CCf+GTYZw@mail.gmail.com>
 <ad788d84-48ea-2fdb-607a-a8d49c8fe52c@kernel.org> <CAFr9PXmkvunO8mu+n7_YFSixe3k0vzowJzrmEWKcs9W677=WNQ@mail.gmail.com>
 <1a267380-c39d-d3a7-9287-61ba632480c3@kernel.org>
In-Reply-To: <1a267380-c39d-d3a7-9287-61ba632480c3@kernel.org>
From:   Daniel Palmer <daniel@0x0f.com>
Date:   Thu, 1 Jun 2023 07:26:24 +0900
Message-ID: <CAFr9PX=yHqjfmYdn9LN9pLm4HO5tquuJibPVZz6NruuiA6wXaA@mail.gmail.com>
Subject: Re: [PATCH 2/3] dt-bindings: rtc: Add Mstar SSD20xD RTC devicetree
 bindings documentation
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Romain Perier <romain.perier@gmail.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>, linux-rtc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi Krzysztof,

On Wed, 31 May 2023 at 15:49, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > This RTC block is a block inside of the SSD201/SSD202D (they are the
>
> But what is SSD201?

Dual Cortex A7 SoC with integrated memory (SSD201 == 64MB, SSD202D ==
128MB) that happens to have an RTC.

Cheers,

Daniel
