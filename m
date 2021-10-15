Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5537B42ED23
	for <lists+linux-rtc@lfdr.de>; Fri, 15 Oct 2021 11:07:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236097AbhJOJJU (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 15 Oct 2021 05:09:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235948AbhJOJJT (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 15 Oct 2021 05:09:19 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AA94C061570
        for <linux-rtc@vger.kernel.org>; Fri, 15 Oct 2021 02:07:13 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id r10so25174398wra.12
        for <linux-rtc@vger.kernel.org>; Fri, 15 Oct 2021 02:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=lXhetO1x2EIYKbDU8xmsFF99cY7vSAOdQQKMdIk4COI=;
        b=AdSs2Ufd0vP7CwVh3j4Url0IZhtaR38yKuqX5gDREXpSTwAbu0qHMLR/0tsYjgLBZK
         mwxxxSlvF/I41V+5vXM9Xbelg/buCLsRNwmfyIH9cC1+83QAkf1W9rUiFNIddnH1BltW
         AEwyY1qQVw6l3nZssC4KyDsXMvcGMccKJHYYMLjRSnyPVVv3q1A4WSq4kXrkvdizk1qu
         hbkHxNz6azjCU7GYQ1F5TDRYK2bWNZu9pM/UuwAsjbBj857Ssi4yjEF/4LojteC+V9+f
         JbWC3yQewHqG2VxOIBFh84tsCbaleOlxX307k2MK3AJao54qPdLnWCp57rb/XC13/cKG
         YirQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=lXhetO1x2EIYKbDU8xmsFF99cY7vSAOdQQKMdIk4COI=;
        b=rRq8TgSs6Dm9pjlDkNsPLxCgulWMh6K7ft8n0//4BEozfwwQA6+yZ+BisKyaTDIJuE
         9Q/TpaGQS5UivkasLylfmDGvhTq/DP0ROX+CJnf5z1zoaEFWRuGKX7SNhwJ/B9naDQhC
         QHLGMnEuoNyHhx7MR/Kv3Ok0e5yJPCd2pOIVoWAq6WSujIdlC/0iEBJQreFCO0eUj2Xm
         4Hv/bFK1AGjiBKZUkHWUuFMOCftvQE0JUki5l4Ip6QmCet6KOOOTI8+mvEdp3EdtTScf
         lirDd0zsxYUX6q+QMs0i+kkdFoBG7iw/kT4klHCvcpj9mv1iAAC/jYslRv2gFpSo8sYS
         DJrw==
X-Gm-Message-State: AOAM532Ya17gDPoqKOz0KNBXs86Eldh6CgclNSWUFUTBhS5IVRduMsW4
        BCzOiFSUmaNxBlxH3wJ2ZCi5tDFjwcjREfWh
X-Google-Smtp-Source: ABdhPJwKe6jZ8mD4AAy4FYrYyKOohSiF/94cG3YfpPaVDWyItUXvFb5WeNyuoJvinxNRHaCpclK32A==
X-Received: by 2002:adf:a415:: with SMTP id d21mr13363344wra.236.1634288831825;
        Fri, 15 Oct 2021 02:07:11 -0700 (PDT)
Received: from ?IPv6:2a00:1098:3142:14:b1cf:1ea:46e5:8f4e? ([2a00:1098:3142:14:b1cf:1ea:46e5:8f4e])
        by smtp.gmail.com with ESMTPSA id 1sm10576611wmb.24.2021.10.15.02.07.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Oct 2021 02:07:11 -0700 (PDT)
Subject: Re: Question about PCF85063A invalid state
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>, linux-rtc@vger.kernel.org
References: <3c6e4252-8271-c968-0bf9-83a23384ce01@raspberrypi.com>
 <YWc+IghMxa4oCcK9@piout.net>
From:   Phil Elwell <phil@raspberrypi.com>
Message-ID: <4b9cbddb-2fbb-e223-80d2-bb13001355af@raspberrypi.com>
Date:   Fri, 15 Oct 2021 10:07:11 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YWc+IghMxa4oCcK9@piout.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Alexandre,

On 13/10/2021 21:14, Alexandre Belloni wrote:
> Hello,
> 
> On 13/10/2021 10:48:48+0100, Phil Elwell wrote:
>> Hi,
>>
>> We're using the PCF85063A on our Compute Module 4 I/O board, and a number of
>> users have experienced problems with invalid state after inserting a backup
>> battery. So far the problem has been confined to EXT_TEST (bit 7 of CTRL_1)
>> being set, but there are a number of registers for which the driver only
>> modifies a subset of the bits.
>>
>> I can think of a number of ways to clear this invalid state, none of which
>> are difficult - force a software reset whenever certain bits of certain
>> registers have certain values, always specifically force some bits to known
>> values, etc. -
>> but are there any preferences or pitfalls to be aware of?
>>
> 
> This is a very difficult topic because contrary to most of the other
> IPs, the RTC is still running while Linux is not and it is expected that
> it will retain its configuration across reboots (well, this is exactly
> what the RTC is for).
> 
> This means that you may have some code (bootloader, firmware) running
> before Linux configuring the RTC and so setting or clearing bits in
> registers that are never touched by Linux. So, it is not possible to go
> and change random bits because they don't have the default value or the
> value we expect. Instead it is usually necessary to provide a way to
> set those bits.
> 
> However, for EXT_TEST, I would assume the RTC lost its time once it is
> set so I would treat it just like OS: if it is set, then leave it that
> way until .set_time is called and return -EINVAL in .read_time.
> 
> I didn't try but if OS is always set by the RTC when EXT_TEST is set,
> then maybe we don't need to check in .read_time.

I think your suggestion can be summarised as:

The existing code probably already detects EXT_TEST because it will cause
the OS bit to be set. All that is required is to clear the EXT_TEST bit
as part of the usual .set_time handler.

I will do it that way.

Many thanks,

Phil
