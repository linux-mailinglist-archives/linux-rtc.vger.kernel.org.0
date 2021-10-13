Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A80442BC03
	for <lists+linux-rtc@lfdr.de>; Wed, 13 Oct 2021 11:49:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238054AbhJMJu7 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 13 Oct 2021 05:50:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239196AbhJMJuy (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 13 Oct 2021 05:50:54 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA7E3C061570
        for <linux-rtc@vger.kernel.org>; Wed, 13 Oct 2021 02:48:50 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id e12so6305008wra.4
        for <linux-rtc@vger.kernel.org>; Wed, 13 Oct 2021 02:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=to:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=Dncr5f630RorEVDAni6of0FL1j48NQFNzLwZhxWYafY=;
        b=p8QAHCc2IIvGhVBgo/gqFtuNdmy506nFVGu2UvJCY+guPH/kMBTG8mq5kum+Wz29Zo
         2krUMb7zVbwYYH/ZmSHQp+u2mCWioFgd5qnSkpRJh1XC2mSD75otaFGkw/JRvr3QqTxW
         wYyDvoVKrB6P+zdHGbVSI3qu6g0gP9cy/HYK/l/eMAPwIb3uA0jmREa7+PjqoDx9Kj1m
         iCb45DjHtjc+1qm9fW3NV9G7nER8sEfaLNc5ZTkbJoso+7emtc2NMoGxw2eZ3pTGrDei
         A3OiYBk3uxQJxO3PmN0WUaH2xRYAnCWUOdvFsNwE6POEIsgoJHe8I5l6drjyTaFB2o7o
         4I+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:to:from:subject:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=Dncr5f630RorEVDAni6of0FL1j48NQFNzLwZhxWYafY=;
        b=l0czJoPZ7pCvoMylUI5eJaPGQlN78iJnzjvOGnyScFmM6KCqH65kasfsZkhvaHXFM2
         +DFPFWxWmq4ayJ6ly2M0J+MthISp9m5UuYAHawCw2fsg0N2rLz4JXJkohvUh1O+Czm9v
         eCjDE2tdwWm54sRWl0qm2bYWYhsPzB022VY4Uq+8Q9iOJXTTDfIS+VY6XgbefpdmD3QS
         gx/32VQbIzOsPxKT8pvVH6jDlnl5xmecd1GSFgSL+w5WsWQPGF4SX+WmTjySU4QWGFZ4
         fEcQKYzWtvtMH3domH4YBRy2AILnnhj40nt+X6NMAmszoihAFDUP2iAs3LGZuLLO6JmH
         FjwA==
X-Gm-Message-State: AOAM530r6uLnZ6AJO2JSk4qZ44ysLnY2heu2U8X7RGaQDwRvm1dWhPgh
        n38Z52CZveYBn5L255inaSfM8N8/YQssHoqC
X-Google-Smtp-Source: ABdhPJxNwhIdNzoEMBV7WPVEg5X1xyxpC6AAnH7tg9RjihGlHaxYUcaKi0S7nEAIJ/8QYWRInD/wjA==
X-Received: by 2002:adf:bbc8:: with SMTP id z8mr39614409wrg.281.1634118529214;
        Wed, 13 Oct 2021 02:48:49 -0700 (PDT)
Received: from ?IPv6:2a00:1098:3142:14:b1cf:1ea:46e5:8f4e? ([2a00:1098:3142:14:b1cf:1ea:46e5:8f4e])
        by smtp.gmail.com with ESMTPSA id l6sm5244680wmg.10.2021.10.13.02.48.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Oct 2021 02:48:48 -0700 (PDT)
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org
From:   Phil Elwell <phil@raspberrypi.com>
Subject: Question about PCF85063A invalid state
Message-ID: <3c6e4252-8271-c968-0bf9-83a23384ce01@raspberrypi.com>
Date:   Wed, 13 Oct 2021 10:48:48 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi,

We're using the PCF85063A on our Compute Module 4 I/O board, and a number of 
users have experienced problems with invalid state after inserting a backup 
battery. So far the problem has been confined to EXT_TEST (bit 7 of CTRL_1) 
being set, but there are a number of registers for which the driver only 
modifies a subset of the bits.

I can think of a number of ways to clear this invalid state, none of which are 
difficult - force a software reset whenever certain bits of certain registers 
have certain values, always specifically force some bits to known values, etc. -
but are there any preferences or pitfalls to be aware of?

Thanks for your input,

Phil Elwell, Raspberry Pi
