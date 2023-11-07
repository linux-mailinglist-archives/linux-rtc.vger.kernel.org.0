Return-Path: <linux-rtc+bounces-220-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ECDD7E4AAA
	for <lists+linux-rtc@lfdr.de>; Tue,  7 Nov 2023 22:27:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B498E28131E
	for <lists+linux-rtc@lfdr.de>; Tue,  7 Nov 2023 21:27:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D0C92A1CD;
	Tue,  7 Nov 2023 21:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ZO3LDLzd"
X-Original-To: linux-rtc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE52EA21
	for <linux-rtc@vger.kernel.org>; Tue,  7 Nov 2023 21:27:37 +0000 (UTC)
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com [IPv6:2607:f8b0:4864:20::129])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C630512F
	for <linux-rtc@vger.kernel.org>; Tue,  7 Nov 2023 13:27:36 -0800 (PST)
Received: by mail-il1-x129.google.com with SMTP id e9e14a558f8ab-35950819c97so4144175ab.0
        for <linux-rtc@vger.kernel.org>; Tue, 07 Nov 2023 13:27:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1699392456; x=1699997256; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pAsdvc2tC0sZt5WnSCuHJooOBmtzWwDbQfPc2qj2gPk=;
        b=ZO3LDLzd6BQA3wJzRa+jiKr+PjkD3R34WcTTTRVEEn8M5cCgv0XMyGyIAXd7FNgd7/
         DnRFUgLWcMcteggwLGfudp8Ov5nouLuKU921diuXmUouypcpGyM06a80sA5QYnw7NAby
         H8OqmNRyHP+rwh3WOpstcr3z/5dZlw7iNNCCY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699392456; x=1699997256;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pAsdvc2tC0sZt5WnSCuHJooOBmtzWwDbQfPc2qj2gPk=;
        b=UBPnUKfXIxwzf6NyJtlTHygwGr6y3bHHG2fSNzN6sxvJ8rK6cCBEO60ReFtL6W6JM7
         h9XjVtJPFxgpXTNJWwo3faXHg4j4J1T+agnDztANwQd8sNqL+eyeTpJLra+8ya/OKXNt
         vYRNZWStjITNGi8jCbH3UlZJkE1VMuaNFNLF0cYafraafxK2liD6HSAX/HJxpIFE6HGD
         At+Z4L/RjrOrdooKDdtbh6A4pKIFwni2Q9MVd5AL1RGukD50+4B9ztqbdlwwa/922YC5
         zy5eIbCoa7HYhvVQukaSfBS9n7B148mNsCFLk1oWnVOD10m7DG2wmicO7epw+nO68npI
         jTjA==
X-Gm-Message-State: AOJu0YyeupHw1NCkNxArsoVoPLhk7T4jfgWqPZCwX6TJRgKB99kZ2waq
	uDdNctDiXzQJTI51Hw2ongjlOIRXI1wHnrcps2I=
X-Google-Smtp-Source: AGHT+IGYtf5cyHwW5eJuAjjUmSGEMSQJ1dHkg8TrWpxZ3Ug1cH9OGIvl+qJ+v74/c3leRuemUosFxg==
X-Received: by 2002:a05:6602:b8c:b0:792:7c78:55be with SMTP id fm12-20020a0566020b8c00b007927c7855bemr176006iob.0.1699392456202;
        Tue, 07 Nov 2023 13:27:36 -0800 (PST)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id m15-20020a056638224f00b004500f7a5903sm2937020jas.102.2023.11.07.13.27.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Nov 2023 13:27:35 -0800 (PST)
Message-ID: <22df3ecb-488c-4d58-8efe-4638fa3d614b@linuxfoundation.org>
Date: Tue, 7 Nov 2023 14:27:35 -0700
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] selftests: rtc: Fixes rtctest error handling.
Content-Language: en-US
To: Atul Kumar Pant <atulpant.linux@gmail.com>, a.zummo@towertech.it,
 alexandre.belloni@bootlin.com
Cc: shuah@kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-rtc@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <20230817091401.72674-1-atulpant.linux@gmail.com>
 <20230923173652.GC159038@atom0118> <20231007154318.GC20160@atom0118>
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20231007154318.GC20160@atom0118>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/7/23 09:43, Atul Kumar Pant wrote:
> On Sat, Sep 23, 2023 at 11:06:58PM +0530, Atul Kumar Pant wrote:
>> On Thu, Aug 17, 2023 at 02:44:01PM +0530, Atul Kumar Pant wrote:
>>> Adds a check to verify if the rtc device file is valid or not
>>> and prints a useful error message if the file is not accessible.
>>>
>>> Signed-off-by: Atul Kumar Pant <atulpant.linux@gmail.com>
>>> ---


Sorry for the delay. I will pick this up for the next rc.

thanks,
-- Shuah

