Return-Path: <linux-rtc+bounces-1766-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 05CA49642BF
	for <lists+linux-rtc@lfdr.de>; Thu, 29 Aug 2024 13:11:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B6859281880
	for <lists+linux-rtc@lfdr.de>; Thu, 29 Aug 2024 11:11:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C955C18E020;
	Thu, 29 Aug 2024 11:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LmCH6dss"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36CB7190674;
	Thu, 29 Aug 2024 11:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724929857; cv=none; b=W40282aiJg2licgWSN+LUcmoMa94feNBLMlHy8y+FgAnFUPBJrIxNxMd+Fwdy1MiiQ/7XNiQXUCYmbl8UFKupBwDDx1KJrdQF+4jaD7end2szxAfwCbO04UKb+QfUgMi3lVaKvmVyf6DwO+28P6O29IKRi8H7TRE97UzVAzFPGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724929857; c=relaxed/simple;
	bh=6SI2/lyqhaIoUJGj02tkJ25nXbbSPE8tjotNBrHjFRs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MjTwbMATdyCXR8E14Z6s1dQW2S6thHco4Tp9aco0N3Piw3EMSVQ+vZV57o0R2rBmA25km+lHl4LB1N7CzOHIaTUDLum96l/eYF3RploymLXMAOTyizC4ryo3jxQrvFjtyrLeTz7/6tM/WhN5EVJ57rR9tKnNHmHi5PYMo+wFosk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LmCH6dss; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-37193ef72a4so361155f8f.1;
        Thu, 29 Aug 2024 04:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724929854; x=1725534654; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6SI2/lyqhaIoUJGj02tkJ25nXbbSPE8tjotNBrHjFRs=;
        b=LmCH6dss9G5T/GKowTME8OkVjYfUpRhR1vTrNyX5xG1Acj5jTIiudBWs7K5tLG/ax8
         N+nmPzoVY65bdsVmhxuvR8dVCL7UtyhXp6x9rsgm2IRKdB5hbB7zM+kQnBcHUU+9Czte
         a+lVYw7mu0udvV/CNN0WKW8Ay9qvyDhryIdcQhIgsQFhSSkI+w+8+h3ginYQ6jL7p5qp
         nhVx+3Gec9oYVh1IF6EuA07PqhOGvqdSS6JihdJk4UTeEXCWVKCIC6fKAeROVdY6h8sC
         /RCh6OKcvC4f47i6aApQ2cb4/tQLnmNnLbwN4dyMcsb9/TMZ9MZH6mzYQD96Td46ogrH
         OEsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724929854; x=1725534654;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6SI2/lyqhaIoUJGj02tkJ25nXbbSPE8tjotNBrHjFRs=;
        b=PD7nEXPd0JGr9+LGWjZ4vi68IuHkEIlMBDyEk0X53MrLXXsPNb/JLLQ12LG4/bBvBp
         f/13AtvbZ63T8h+GVX7UyHgWtfoLc14ZKKCIvUccu+5WolP1tZQuc+RReOrfD0any4lN
         cDzoH5HwjibIP6Vu9VlSkcY27kXuwCg6BRxgclMq763aIpY8+OIjnudPi3V29XsFLYPJ
         7SjMdTaJP7/TJfircT0tk5OkBz41adsAoEPj3RrsGCtNDvJSKB2jcBik+Zi3gwy5Bboi
         d1qEG1ryHR6ZqlsTEvr5/qHtfIUVOa9lPS3c9oGL/KSTsNwf69+v3f104cQxUxu7rsUv
         XSWA==
X-Forwarded-Encrypted: i=1; AJvYcCWLj/rbgzOqSQXRi5DCp0o3HbuVkHWq01O1a7PpWv4MsOS3QNBFalStUOrO7a6UEQ1fOXKL4KOncYKO@vger.kernel.org, AJvYcCXlh2fQzhnen0wIKzsKp8aqm8aoUA3E/bPCguKP872/y/BeXKUrzLvPMZ5eVWoQ3HS0gDBd7PIfcQCsZ3w=@vger.kernel.org
X-Gm-Message-State: AOJu0YxzMgBtmEC/a/h7qdKHx3wMWM1cg//ynGukE6WTljXdyvHTsBof
	32laRIDx9TWcqDyYndfbaBgyifL0bOi/CxKDv4wZ88/eW5Rd4AuE2basIY8l
X-Google-Smtp-Source: AGHT+IG9s3hpkv6OK/W1x8fPf5JzfVj+jZ5LiyGMPxmRcTThesjyrHRmAq/ziTdoVEhmXxZMx7YCDQ==
X-Received: by 2002:a5d:59a9:0:b0:35f:cd7:5ba1 with SMTP id ffacd0b85a97d-3749b585ddamr2083795f8f.60.1724929853785;
        Thu, 29 Aug 2024 04:10:53 -0700 (PDT)
Received: from ubuntu2204 (fgw-godollo.uni-mate.hu. [192.188.242.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42bb6deb2f5sm13912935e9.2.2024.08.29.04.10.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 04:10:53 -0700 (PDT)
Date: Thu, 29 Aug 2024 13:10:51 +0200
From: =?utf-8?B?VMOzdGggSsOhbm9z?= <gomba007@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org, csokas.bence@prolan.hu
Subject: Re: [PATCH v5 2/2] dt-bindings: rtc: Add support for SD2405AL.
Message-ID: <xtauzwfdqeg6scijjhg2khd6jd2tyfjjyf7dtpaj53esnvlki6@qaix4scw2f4l>
References: <20240828-rtc-sd2405al-v5-0-9e3f8fa5ea6b@gmail.com>
 <20240828-rtc-sd2405al-v5-2-9e3f8fa5ea6b@gmail.com>
 <0f328688-99e1-41c0-9300-c7ff847ebabc@kernel.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0f328688-99e1-41c0-9300-c7ff847ebabc@kernel.org>

Dear Krzysztof,

Thank you for the advice, and sorry for the inconvenience.

Best regards,
János


