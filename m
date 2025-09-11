Return-Path: <linux-rtc+bounces-4863-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9844DB53312
	for <lists+linux-rtc@lfdr.de>; Thu, 11 Sep 2025 15:02:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D57801C23D0B
	for <lists+linux-rtc@lfdr.de>; Thu, 11 Sep 2025 13:02:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C2D6324B12;
	Thu, 11 Sep 2025 13:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lb3MT6aa"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41F29322A05;
	Thu, 11 Sep 2025 13:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757595739; cv=none; b=aJ8v4lld64UpoaqyAbCkzZuuBe3McbxLNjn9qdz2SYRY5entyQc9WzyjWVR3fFx6++AwZ20kzO6/IN3X49VtgqxLkqVzaesipB2DlFCQR4Tf4IWlm79w0CsaPm07aMa1cJmee/ToV1Do3aahBfEVJwR6xUbpdo+Xa0ON2gvbixQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757595739; c=relaxed/simple;
	bh=0JsjGcFTT+mB13p+yelQVRgX1BqDUcW18s1oewksJGE=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=hGKqXo9t9cwnoyxQ5F9cYTfe4aoV/K+mv/lpof3IIjr9EU1Je2TYpvIT0Q2HOP6HWxPa09cu4kmumuiRTBmC2BvjCyOJ9bvrWaF2qdEvnty8gd7WbghLx0eSA1ljqls82f7df+5NwHqQgWkzCyiITwHSfRjNLzGy7yX4O5qoVco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lb3MT6aa; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-45df7ca2955so3263525e9.3;
        Thu, 11 Sep 2025 06:02:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757595736; x=1758200536; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4MqrGMT4gYHEDE95276JluVewZB8Y2DkUm+5Ln4jUr8=;
        b=lb3MT6aaSz9SFZotrdBT3/Q8QFId5zp6ct4qtmbE0c0IHBu15YfOCe46s/ApFZDXGr
         vYfe26mabkGmuCjVhMw9OTG5geuKCzY8rIl7iQNivh1SxyZRDZUs+h6YA4K8wQ9J2JYK
         vLApj32MA6cePA3Fkyx/I460V/07d9GMYm8B8rw2LwoHSNZBFlL62jfAc8lYXDNO9dYl
         L4T84uoy3PXi9oNsol0XQu379nJS2nc36VVm6+CHx/9yEYTJHPLxu1sKFed30l+UI2iH
         R0wjG+hxmtV1dJUbyxrjyHDtHRcGujU9GFktR8+WFYclWkiH8XtszRnnWMamzWZZq8ZM
         dq1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757595736; x=1758200536;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4MqrGMT4gYHEDE95276JluVewZB8Y2DkUm+5Ln4jUr8=;
        b=H39teV9BPSwZStkGqjbvVFSOizODS72THF6edvLg7zs0l13ExP5BQFKev8dc8043ET
         ERlFwpZwxA+Q6j/htkKjQ2iknXd0m+RAXkx4jNEvRUP6ExyAMfRmcPtQjR0pghhrCgPi
         Y81iofj7no2mnnqt1JK6eOGALOxAV3o/+2MaGOGxoitHnI6/edlZs2TyNThkQ5zwG9+b
         B6kJPNg7CBGeW6gWrZ2QsHoCq+4cfOzKmCnHoxp5x7cuRPHlzx/gKYD03S8zknEMyqSF
         gHUVv3yfAhdteX3il/EB/H4y+6/Y/A9y6TY1KxKOv+lHDR5vdfXqG423dH6hbshF/hri
         W16g==
X-Forwarded-Encrypted: i=1; AJvYcCULlg4zVFq+/2q0gX3ZEyPs/qUaYdDHb6DDZ6zmqw1h5RVLgsXwX5hEOMR072ih0nbrufHahxC4bDtXRLA=@vger.kernel.org, AJvYcCX/MAH1Ee5bil0KAQy6k17xy4mtaaCwe1WqSg0OA5WcgfD0Vmg5GI8OuGETmqfzcNvAl/qDNdtzFFam@vger.kernel.org
X-Gm-Message-State: AOJu0YyuFclOWqDMsKFdKxsh9ZV9yn6dsVA5/Uv2HJBvyVuqVcKm8zMv
	LkK4yNZNL3mf9LLCaG9orQXxcejRaURXPTksl7nrANctS/tOo15EoVzhdhp1MBpX
X-Gm-Gg: ASbGnctgvImPlVY87107m2VPICcnsl1vhWgjH8ZXJtMucnFRMlxfECVLEOvXTsj4whS
	a23UqrBfklRRDZ0WZMUtuT8DiWX954BqgJRboUeMXH4JwKocDSSFntL3sxe/hG33BNG2p1WzEkU
	U13p/u0tL1iZOc5yCVvW85kjj0cD4Yiqx24Ks1r42ujyxprfyxRqHHId9tkLJhl+59mkV5CWMOe
	sC1+GeA8dBjfhaxW00Mtn+JJLHMQj3tGPCeod/KJlcL3zC8A0Z8Cc3WqdvAWDdo3uwsRgfw+SeK
	ugSLod9pAGZi51fUFggIEhzilYVaIVyIeAIhCj3UKpbXBSboYghtB/P0FXwqnP1mNwryHnAtZVM
	7X27F/YHoqsJ4jZerhM+j0j6cZxxjIYwFzYviCmhNNbKoXKZGUbBgKlwtxqVAOOdsz/1Ixl9LNQ
	S5KUUSRGSFsPzJoJmkjw0TCGRz5fyCmDwKx7Vr/qrbxTaTl9BmvdiCa7oUC9UUuyh5Qw==
X-Google-Smtp-Source: AGHT+IGBOvVZEanDymsSCzD5uKwzNIrpA1+ow8iNte/zspzRRuQdTlNd8GKRKv8tv4hBSd91nRRPVw==
X-Received: by 2002:a05:600c:1387:b0:45d:d2cd:de36 with SMTP id 5b1f17b1804b1-45dddeb8e9emr178967705e9.12.1757595735989;
        Thu, 11 Sep 2025 06:02:15 -0700 (PDT)
Received: from ?IPV6:2a02:8440:7130:c664:5cf3:46ff:1e0c:dcb9? (2a02-8440-7130-c664-5cf3-46ff-1e0c-dcb9.rev.sfr.net. [2a02:8440:7130:c664:5cf3:46ff:1e0c:dcb9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7607d7affsm2554580f8f.48.2025.09.11.06.02.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Sep 2025 06:02:13 -0700 (PDT)
Message-ID: <1455564d-1cc0-4feb-80ac-f0a619fe73df@gmail.com>
Date: Thu, 11 Sep 2025 15:02:12 +0200
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: clement.legoffic@foss.st.com
Cc: alexandre.belloni@bootlin.com, clement.leger@bootlin.com,
 jens.wiklander@linaro.org, linux-kernel@vger.kernel.org,
 linux-rtc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
References: <20250715-upstream-optee-rtc-v1-0-e0fdf8aae545@foss.st.com>
Subject: Re: [PATCH 0/3] Add alarm operation to the rtc-optee driver
Content-Language: en-US
From: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
In-Reply-To: <20250715-upstream-optee-rtc-v1-0-e0fdf8aae545@foss.st.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello,

Anyone to review this series ?
I used the mailto:link from the lore.kernel website here:
https://lore.kernel.org/all/20250715-upstream-optee-rtc-v1-0-e0fdf8aae545@foss.st.com/ 

Let me know if the series needs a resend.

Best regards,
Clément

