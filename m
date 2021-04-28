Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4E9136E1F8
	for <lists+linux-rtc@lfdr.de>; Thu, 29 Apr 2021 01:06:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230385AbhD1XH2 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 28 Apr 2021 19:07:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229488AbhD1XHZ (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 28 Apr 2021 19:07:25 -0400
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com [IPv6:2607:f8b0:4864:20::72e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B0A8C06138B;
        Wed, 28 Apr 2021 16:06:39 -0700 (PDT)
Received: by mail-qk1-x72e.google.com with SMTP id i12so33869195qke.3;
        Wed, 28 Apr 2021 16:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=9qLoG8GhVsaODXvAxNVSdW8lGghLvmtsq9pFbRDh42Y=;
        b=TDZzd9Yjn7zwOBAE6kqvkUuPXbahUd+wVeSFZKpWbKob9fl3wAJ1WJT8p4BGmnMUK/
         DuJ3P1fGBC08Jw+LZwhm+xfSjdPlfsmvxQvQuBj0399jIdirjmH5Q03qVy8G1VOVOR7e
         x+vWDHkzR7HRTU0Cs5c9Oz0pVn31wfPsKtsl5akMO//OBs3Gu+hSPMeH2f9XIdV7to6c
         NPO1MW9vE8WwwZ6C0OQOn7NHVG0s6a345neSRiErDR22MWcZUrL9IxCku2/RRZ/WZxJX
         PFP/MuNqi9PEq5PLw2kCn6xW6s7eVR7IQq5F7JLlBilwKShwJSTAqPLknTAnXJyh2Or9
         NF4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=9qLoG8GhVsaODXvAxNVSdW8lGghLvmtsq9pFbRDh42Y=;
        b=bM5sn9SXhe1fUW43RNrpOTodekqbNNrDn5GLDm28oGXokjfMVgtjmn39qNlxNud8hB
         1HMNtRsWPvHnjwr/iQ8waSr5Pyn8w54vF5lp09Ssb3auECBfxL6bhxfDHKY8ZpSgtLHM
         7/D6GuNU7hgQnzJ/5lQBMgZV7b1crSKcPHJlZagyW/RSQkH3VDZBfNnR6SlLFqmjEHXt
         4/D5XGd/vrIsdLLJERDb4jw3Ntxc/z+p9TSgsA/ygHxX8mD2A4lBElnD33hgWMj1ji1D
         P6vxroxFtCK4C6gZTMVcO6QnLOjS4i5tsM1BFoTiOvW4LUFPMRl1mAPbfEpfa2jjLcGA
         AISQ==
X-Gm-Message-State: AOAM5304ecwhvqrB+hM3uy++5YMHyRK4f6w32fCyq6iXCpqta9u92y4f
        ElgLDbI1B8eQyeTUQpA7O0U=
X-Google-Smtp-Source: ABdhPJx7/CKXkBSSiNqr83HqQNA928kpne7Yz76AtLT3qadpPggSsUB4qoL9p1sjG/M1p1Qei8ubGg==
X-Received: by 2002:a05:620a:232:: with SMTP id u18mr8411245qkm.213.1619651198317;
        Wed, 28 Apr 2021 16:06:38 -0700 (PDT)
Received: from ?IPv6:2601:152:4100:57e0:91c9:b195:c9a6:94c1? ([2601:152:4100:57e0:91c9:b195:c9a6:94c1])
        by smtp.gmail.com with ESMTPSA id h62sm891040qkf.116.2021.04.28.16.06.36
        (version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Wed, 28 Apr 2021 16:06:37 -0700 (PDT)
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.6\))
Subject: Re: [PATCH 2/2] m68k: introduce a virtual m68k machine
From:   Josh Juran <jjuran@gmail.com>
In-Reply-To: <CAMuHMdUFh2W-bY5Ez1aOTZQjq0=THvmOf22JdxWoNNtFLskSzw@mail.gmail.com>
Date:   Wed, 28 Apr 2021 19:06:10 -0400
Cc:     Laurent Vivier <laurent@vivier.eu>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Content-Transfer-Encoding: 7bit
Message-Id: <F9FB9B1D-3B31-452D-AD67-D1C57A302B83@gmail.com>
References: <20210323221430.3735147-1-laurent@vivier.eu> <20210323221430.3735147-3-laurent@vivier.eu> <CAMuHMdUFh2W-bY5Ez1aOTZQjq0=THvmOf22JdxWoNNtFLskSzw@mail.gmail.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
X-Mailer: Apple Mail (2.1878.6)
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Apr 28, 2021, at 8:04 AM, Geert Uytterhoeven <geert@linux-m68k.org> wrote:

> This can be simplified by shifting irq_pending instead of irq_bit:
> 
>    do {
>            if (irq_pending & 1)
>                    generic_handle_irq(irq_num);
> 
>            ++irq_num;
>            irq_pending >>= 1;
>    } while (irq_pending);
> 
> Unfortunately m68k doesn't have a single-instruction __ffs().

The 68000 and 68010 don't, but couldn't the 68020's BFFFO do the job?

Josh

