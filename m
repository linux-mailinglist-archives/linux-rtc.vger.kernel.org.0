Return-Path: <linux-rtc+bounces-3722-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C5DB7A78DD8
	for <lists+linux-rtc@lfdr.de>; Wed,  2 Apr 2025 14:07:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D879E3AA62F
	for <lists+linux-rtc@lfdr.de>; Wed,  2 Apr 2025 12:06:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2ABF238143;
	Wed,  2 Apr 2025 12:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mvista.com header.i=@mvista.com header.b="Z6WlDGmn"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C7D7235360
	for <linux-rtc@vger.kernel.org>; Wed,  2 Apr 2025 12:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743595578; cv=none; b=twRMOQjav8zk415rNhtf0kqIdH5+yWONGy8cKEQK7gzi298JFg9lYNIE7lA5pV7g3QUksqJALBVsw6mTe1tIICZNZZOGwwptiAwYi5aK9kXkNLrghnaW64nO3bNMaC2Egt3NknFK9PrcRvj3rLESFwt0r5cDlFnKzQg74STCri0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743595578; c=relaxed/simple;
	bh=/uTmJ9UsYWYEJS6myozRG/JY4Df0PtAl0v3aecAqDDQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BBa8iFYou9tucHqjPOVihLtEBHbFbfUZMOd4CSgPCJ69j0z4k96HFzOIU0oVoeDuOnQUHVxhI/QH//VtE6jPesCEjzmJbAkrZMjFZh/ARImP/wMkTh92pj49FYs3txxWMDN2BS0DZF8U8xiPJi0swsxlTRO5EG9AYb0uOqDWvPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mvista.com; spf=pass smtp.mailfrom=mvista.com; dkim=pass (1024-bit key) header.d=mvista.com header.i=@mvista.com header.b=Z6WlDGmn; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mvista.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mvista.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-22622ddcc35so58385515ad.2
        for <linux-rtc@vger.kernel.org>; Wed, 02 Apr 2025 05:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1743595576; x=1744200376; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/uTmJ9UsYWYEJS6myozRG/JY4Df0PtAl0v3aecAqDDQ=;
        b=Z6WlDGmn2k/VWb1EBVXZp+HZSPU7mZTRuGKgJ2faAgSVO4pujUZxuDaTq26dvsS+c+
         Pikcv5ka/wQKXlT6NyNg4p3lnpnqS4epDYv4xW28WbSbiAPXBIbuSDDQoNDSSY+faQpC
         +ZMUh3zbqz0w9VeX7bD7TBdsLDPbdaP+I4mJo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743595576; x=1744200376;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/uTmJ9UsYWYEJS6myozRG/JY4Df0PtAl0v3aecAqDDQ=;
        b=MFnTD/bB5tusDNeiBrpxNUb8NAqkl1TkNvR6zUg2VdBzC5cLIY+71+DWjDWhQgh5p2
         L/ECZ+2zkDSnxWNRp+nqYSDyaLj0zLA3eYBy8A7oABK04Y9pLzkyUEFbwUYB71y/xIqj
         u2RLNIJE1h9qI3zDgQWQJviVIghTmzMF4H0DOowEqfRYOYewg+RHpvZqs5N8hFb597WX
         nywf/lLElAPs3NLGLebfmRTSrzc61rlzuPqlzWjo9QSvhbidyGX1ZSRVK0KrL2qSwCNH
         Ew0O3/C9CG0rQOEGwZgBji/9u88R3wCr9ceILGKm/vHrjJgXZz2sX85zsis1gtDLa004
         USCg==
X-Gm-Message-State: AOJu0YxSKJVUkteXdXU/s+4sGTc0kzsOWHPvg3lPTV3cRAx5Nl6j0SJ5
	oEHDj1iMmqStW5FKH3uVSNzzoSz1jkEYaZcCcmoL7ZHmtav4lkO7fDm2RrKpxAY=
X-Gm-Gg: ASbGncv7QcZ9xuJrymiwW1OXppluQLuTxXzO1boZPaAqo7BqfD5bRZAWvgFRzl/49Pf
	F9ruz4zQv5D8e7k+k78YwXwM7SIAoeCsNTzyYxMeBI82c+aq1OMtMpxXcJvjmB7czTo9TQjOQNK
	5Ad6RvK2WHJgh5yjrK7/ihz027r6DHyXony6Zr5A1CFODAM0IOIJDl5zJ+I3aA9bR48zpS1i/RI
	EkxGOcIMtTFoPTb4ibMWnO86C4OsNzTVfo/U6kcoGhvOdjQYILRfroNJicoe9h7ekbDtoMy8Oc5
	9RfqiIIYfK/09cUscC+w+L29KLxUf9cV/Fnnvv1uGwPaMrAVidUNtUG44Eo=
X-Google-Smtp-Source: AGHT+IG64VGCl5I7155VMIOLlEDzBLsaOanZgQIzLZTNCCSEsbqCU6XYP90rg4jT/vHTLE8X1okjyw==
X-Received: by 2002:a17:902:ce08:b0:227:e74a:a057 with SMTP id d9443c01a7336-2296c879757mr33719785ad.44.1743595576545;
        Wed, 02 Apr 2025 05:06:16 -0700 (PDT)
Received: from niyas-desktop.mvista.com ([182.74.28.237])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291eedd2bcsm106477375ad.65.2025.04.02.05.06.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 05:06:16 -0700 (PDT)
From: nmydeen@mvista.com
To: alexandre.belloni@bootlin.com
Cc: linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	cminyard@mvista.com
Subject: Re: Re: [PATCH] rtc-m41t62: kickstart ocillator upon failure 
Date: Wed,  2 Apr 2025 17:35:45 +0530
Message-Id: <20250402120546.336657-1-nmydeen@mvista.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250401090454fb0ccf16@mail.local>
References: <20250401090454fb0ccf16@mail.local>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thanks, Hope it meets the expected


