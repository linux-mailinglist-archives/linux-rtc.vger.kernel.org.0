Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2D6DC5F7941
	for <lists+linux-rtc@lfdr.de>; Fri,  7 Oct 2022 15:51:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230002AbiJGNvi (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 7 Oct 2022 09:51:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229999AbiJGNvh (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 7 Oct 2022 09:51:37 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18F9B1B7B8
        for <linux-rtc@vger.kernel.org>; Fri,  7 Oct 2022 06:51:36 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id d6so7372519lfs.10
        for <linux-rtc@vger.kernel.org>; Fri, 07 Oct 2022 06:51:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QrxnzkuwZDQYqR8TERT+UFYATzo6ewdwfI7spXmYrRA=;
        b=QWe8wuHg5be14uDa+SrQi/baJVMOH35gZro6o/lqjNR9gccTpRSas06iv4gTosOA8v
         mm58ll9yeAVtj/hUpG7Pzco77gVKUE8s3JTGkG4BCgv7KvsD9gbEO4E+n2uKrtSVP4Y1
         e2z9AAl5OZBQ9ZnoZTC8vBBmGtZMn63tdHqeU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QrxnzkuwZDQYqR8TERT+UFYATzo6ewdwfI7spXmYrRA=;
        b=gGcmf1CcKex1vM9ukYy3GQZc9VCHI4yBBPQOIZrUAvJ1M+7qbScejvTXLJhG5Oc3pM
         +2tm8w8kmU0lfH8ZLAoo/QEI+9oLqM+e6U28gsf5OqYbuLvtse7YXY71Py1/ZM2odFBa
         PYSHgdI23qwWC8LC8/nO6IavY4ke3rxSeSZvl087ApFijAlv/6wvM9G+EUaK/5sPD7Xs
         j0nPJKMVa3oFR7bovgjTAQooftLfb8wLnjLhlU6QKZeByrPgUDGnu4UtuQSpr7jIqw/h
         kmcDvXfi+qJ8vnn+2SSxfJKoputvLTni8FF8h3CZ+qqGXBzK7LuP9tyqGHbroBM/pWMv
         mYQw==
X-Gm-Message-State: ACrzQf0wT9bs4k7SQBqWEwtP78GFhY04xB9jbelJ02nNlzUeXk/da0ZG
        MkR/cp/pj9VZyfTjhYfxJY0FuyR5qX/MtmfS
X-Google-Smtp-Source: AMsMyM5lPdfLyTMCt4eIcvy3rowBX1fNzK2w3HCIyf+tBCFGbwYF/1vBvLeH3k5JvNOCJ23L6QxjTw==
X-Received: by 2002:a05:6512:3295:b0:4a2:71e9:b30f with SMTP id p21-20020a056512329500b004a271e9b30fmr1825434lfe.120.1665150694439;
        Fri, 07 Oct 2022 06:51:34 -0700 (PDT)
Received: from [172.16.11.74] ([81.216.59.226])
        by smtp.gmail.com with ESMTPSA id z18-20020a056512371200b0049313f77755sm298734lfr.213.2022.10.07.06.51.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Oct 2022 06:51:33 -0700 (PDT)
Message-ID: <43f3df69-ee47-ed8a-3b31-927ad861ad8c@rasmusvillemoes.dk>
Date:   Fri, 7 Oct 2022 15:51:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 0/9] rtc: isl12022: cleanups and hwmon support
Content-Language: en-US
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org
References: <20220830100152.698506-1-linux@rasmusvillemoes.dk>
 <20220921114624.3250848-1-linux@rasmusvillemoes.dk>
From:   Rasmus Villemoes <linux@rasmusvillemoes.dk>
In-Reply-To: <20220921114624.3250848-1-linux@rasmusvillemoes.dk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 21/09/2022 13.46, Rasmus Villemoes wrote:
> This series does a few cleanups of the isl12022 driver,
> 
> - removes use of deprecated function
> - removes some redundant code
> - switches to regmap API instead of private helpers
> 
> It also provides range_min, range_max values and finally hooks up the
> temperatur sensor to hwmon.
> 

Ping. Alexandre, anything I need to do to move this forward?

Thanks,
Rasmus
